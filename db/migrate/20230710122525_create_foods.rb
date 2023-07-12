class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :name, null: false
      t.float :protein, null: false
      t.float :fat, null: false
      t.float :carbohydrate, null: false
      t.integer :calorie, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
