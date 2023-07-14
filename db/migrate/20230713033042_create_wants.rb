class CreateWants < ActiveRecord::Migration[7.0]
  def change
    create_table :wants do |t|
      t.float :weight, null: false
      t.integer :protein, null: false
      t.integer :fat, null: false
      t.integer :carbohydrate, null: false
      t.float :diet_weight, null: false
      t.integer :diet_protein, null: false
      t.integer :diet_fat, null: false
      t.integer :diet_carbohydrate, null: false
      t.references :user, null: false, foreign_key: true    
      t.timestamps
    end
  end
end
