class CreatePreFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :pre_foods do |t|
      t.string :name, null: false
      t.float :protein, null: false
      t.float :fat, null: false
      t.float :carbohydrate, null: false
      t.integer :calorie, null: false
      t.timestamps
    end

    PreFood.create(name: 'うどん(かけ)', calorie: 266, protein: 10.6, fat: 1.1, carbohydrate: 53.4)
    PreFood.create(name: 'うどん(かき揚げ)', calorie: 288, protein: 7.6, fat: 3.6, carbohydrate: 56.4)
    PreFood.create(name: 'うどん(天ぷら)', calorie: 356, protein: 18.9, fat: 7, carbohydrate: 54.3)
    PreFood.create(name: 'おにぎり(梅)', calorie: 184, protein: 3, fat: 0.4, carbohydrate: 42.1)
    PreFood.create(name: 'おにぎり(鮭)', calorie: 192, protein: 6.4, fat: 0.9, carbohydrate: 39.6)
    PreFood.create(name: 'おにぎり(ツナマヨ)', calorie: 216, protein: 4.8, fat: 4.2, carbohydrate: 39.7)
    PreFood.create(name: 'オムライス', calorie: 710, protein: 30.5, fat: 25.7, carbohydrate: 89.2)
    PreFood.create(name: 'カップ麺(醤油)', calorie: 250, protein: 5.1, fat: 9.9, carbohydrate: 35.2)
    PreFood.create(name: 'カップ麺(味噌)', calorie: 247, protein: 7.1, fat: 8, carbohydrate: 36.6)
    PreFood.create(name: 'カレー', calorie: 664, protein: 19.5, fat: 21.5, carbohydrate: 98.2)
    PreFood.create(name: 'カレー(カツ)', calorie: 1047, protein: 35.4, fat: 56.1, carbohydrate: 100.1)
    PreFood.create(name: 'ごはん', calorie: 242, protein: 3.8, fat: 0.5, carbohydrate: 55.6)
    PreFood.create(name: 'ごはん(半分)', calorie: 121, protein: 1.9, fat: 0.25, carbohydrate: 27.8)
    PreFood.create(name: 'ごはん(TKG)', calorie: 315, protein: 10.1, fat: 5.6, carbohydrate: 56.1)
    PreFood.create(name: 'サンド(ミックス)', calorie: 427, protein: 21.7, fat: 25.2, carbohydrate: 28.3)
    PreFood.create(name: '食パン(6枚切り)', calorie: 181, protein: 6.2, fat: 2.9, carbohydrate: 32.5)
    PreFood.create(name: 'そば(かけ)', calorie: 330, protein: 15, fat: 2.3, carbohydrate: 62.2)
    PreFood.create(name: 'そば(ざる)', calorie: 295, protein: 11.2, fat: 2, carbohydrate: 58)
    PreFood.create(name: 'そば(かき揚げ)', calorie: 352, protein: 12, fat: 4.8, carbohydrate: 65.2)
    PreFood.create(name: 'チャーハン', calorie: 526, protein: 13.1, fat: 9.9, carbohydrate: 96.1)
    PreFood.create(name: '丼(親子)', calorie: 604, protein: 24.8, fat: 15.7, carbohydrate: 90.9)
    PreFood.create(name: '丼(海鮮)', calorie: 440, protein: 22.2, fat: 5.5, carbohydrate: 75.4)
    PreFood.create(name: '丼(カツ)', calorie: 1029, protein: 41.4, fat: 52.4, carbohydrate: 97.9)
    PreFood.create(name: '丼(牛)', calorie: 616, protein: 25.3, fat: 18.1, carbohydrate: 87.9)
    PreFood.create(name: '丼(天)', calorie: 522, protein: 12.4, fat: 9.9, carbohydrate: 95.8)
    PreFood.create(name: '丼(ネギトロ)', calorie: 447, protein: 23.2, fat: 6, carbohydrate: 75.1)
  end

end
