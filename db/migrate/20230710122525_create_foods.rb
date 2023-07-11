class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :name, null: false
      t.integer :protein, null: false
      t.integer :fat, null: false
      t.integer :carbohydrate, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
