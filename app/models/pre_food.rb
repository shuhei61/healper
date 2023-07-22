class PreFood < ActiveHash::Base
  self.data = [
    { id: 1, name: 'うどん(かけ)', calorie: 265.9, protein: 10.6, fat: 1.1, carbohydrate: 53.4 },
    { id: 2, name: 'うどん(かき揚げ)', calorie: 288.4, protein: 7.6, fat: 3.6, carbohydrate: 56.4 },
    { id: 3, name: 'うどん(天ぷら)', calorie: 355.8, protein: 18.9, fat: 7, carbohydrate: 54.3 },
    { id: 4, name: 'おにぎり(梅)', calorie: 184, protein: 3, fat: 0.4, carbohydrate: 42.1 },
    { id: 5, name: 'おにぎり(鮭)', calorie: 192.1, protein: 6.4, fat: 0.9, carbohydrate: 39.6 },
    { id: 6, name: 'おにぎり(ツナマヨ)', calorie: 215.8, protein: 4.8, fat: 4.2, carbohydrate: 39.7 },
    { id: 7, name: 'オムライス', calorie: 710.1, protein: 30.5, fat: 25.7, carbohydrate: 89.2 },
    { id: 8, name: 'カップ麺(醤油)', calorie: 250.3, protein: 5.1, fat: 9.9, carbohydrate: 35.2 },
    { id: 9, name: 'カップ麺(味噌)', calorie: 246.8, protein: 7.1, fat: 8, carbohydrate: 36.6 },
    { id: 10, name: 'カレー', calorie: 664.3, protein: 19.5, fat: 21.5, carbohydrate: 98.2 },
    { id: 11, name: 'カレー(カツ)', calorie: 1046.9, protein: 35.4, fat: 56.1, carbohydrate: 100.1 },
    { id: 12, name: 'ごはん', calorie: 242.1, protein: 3.8, fat: 0.5, carbohydrate: 55.6 },
    { id: 13, name: 'ごはん(半分)', calorie: 121.05, protein: 1.9, fat: 0.25, carbohydrate: 27.8 },
    { id: 14, name: 'ごはん(TKG)', calorie: 315.2, protein: 10.1, fat: 5.6, carbohydrate: 56.1 },
    { id: 15, name: 'サンド(ミックス)', calorie: 426.8, protein: 21.7, fat: 25.2, carbohydrate: 28.3 },
    { id: 16, name: '食パン(6枚切り)', calorie: 180.9, protein: 6.2, fat: 2.9, carbohydrate: 32.5 },
    { id: 17, name: 'そば(かけ)', calorie: 329.5, protein: 15, fat: 2.3, carbohydrate: 62.2 },
    { id: 18, name: 'そば(ざる)', calorie: 294.8, protein: 11.2, fat: 2, carbohydrate: 58 },
    { id: 19, name: 'そば(かき揚げ)', calorie: 352, protein: 12, fat: 4.8, carbohydrate: 65.2 },
    { id: 20, name: 'チャーハン', calorie: 525.9, protein: 13.1, fat: 9.9, carbohydrate: 96.1 },
    { id: 21, name: '丼(親子)', calorie: 604.1, protein: 24.8, fat: 15.7, carbohydrate: 90.9 },
    { id: 22, name: '丼(海鮮)', calorie: 439.9, protein: 22.2, fat: 5.5, carbohydrate: 75.4 },
    { id: 23, name: '丼(カツ)', calorie: 1028.8, protein: 41.4, fat: 52.4, carbohydrate: 97.9 },
    { id: 24, name: '丼(牛)', calorie: 615.7, protein: 25.3, fat: 18.1, carbohydrate: 87.9 },
    { id: 25, name: '丼(天)', calorie: 521.9, protein: 12.4, fat: 9.9, carbohydrate: 95.8 },
    { id: 26, name: '丼(ネギトロ)', calorie: 447.2, protein: 23.2, fat: 6, carbohydrate: 75.1 }
  ]

  include ActiveHash::Associations
  has_many :calendar_pre_foods

  def calendars
    calendar_pre_foods.map(&:calendar)
  end

  end