class CustomRegistrationsController < Devise::RegistrationsController
  include CalendarsHelper

  def create
    super do |resource|
      if resource.persisted?
        create_wants(resource)
      end
    end
  end

  private

  def create_wants(user)
    weight = user.weight
    essential_cal = user.essential_cal
    protein_range = calc_protein(user.age, weight, user.level_id, essential_cal)
    protein_better = ((protein_range.min + protein_range.max) / 2).round
    calc_diet_protein = (weight * (1 - user.fat_body / 100) * 2).round
    calc_fat = (essential_cal * 0.25 / 9).round
    calc_diet_fat =(essential_cal * 0.2 / 9).round
    calc_carbohydrate = ((essential_cal - protein_better * 4 - calc_fat * 9) / 4).round
    calc_diet_carbohydrate = ((essential_cal - calc_diet_protein * 4 - calc_diet_fat * 9) / 4).round
    Want.create(protein: (protein_better).round, fat: calc_fat, carbohydrate: calc_carbohydrate, diet_weight: 0.5, diet_protein: calc_diet_protein, diet_fat: calc_diet_fat, diet_carbohydrate: calc_diet_carbohydrate, user_id: user.id)
  end
end
