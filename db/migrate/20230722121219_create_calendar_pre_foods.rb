class CreateCalendarPreFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :calendar_pre_foods do |t|
      t.references :calendar, null: false, foreign_key: true
      t.references :pre_food, null: false, foreign_key: true      
      t.timestamps
    end
  end
end
