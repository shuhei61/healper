class CreateCalendarFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :calendar_foods do |t|
      t.references :calendar, null: false, foreign_key: true
      t.references :food, null: false, foreign_key: true
      t.timestamps
    end
  end
end
