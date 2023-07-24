require 'rails_helper'

RSpec.describe Food, type: :model do
  before do
    @food = FactoryBot.build(:food)
  end

  describe '料理新規登録' do
    context '新規登録できるとき' do
      it '必要な情報を適切に入力して「保存」ボタンを押すと、新規登録ができる' do
        expect(@food).to be_valid
      end
      it 'たんぱく質は小数でも登録できる' do
        @food.protein = '20.5'
        expect(@food).to be_valid
      end
      it '脂質は小数でも登録できる' do
        @food.fat = '7.5'
        expect(@food).to be_valid
      end
      it '炭水化物は小数でも登録できる' do
        @food.carbohydrate = '70.5'
        expect(@food).to be_valid
      end
    end

    context '新規登録ができない' do
      it '名前が必須であること' do
        @food.name = ''
        @food.valid?
        expect(@food.errors.full_messages).to include("Name can't be blank")
      end
      it 'たんぱく質が必須であること' do
        @food.protein = ''
        @food.valid?
        expect(@food.errors.full_messages).to include("Protein can't be blank")
      end
      it '脂質が必須であること' do
        @food.fat = ''
        @food.valid?
        expect(@food.errors.full_messages).to include("Fat can't be blank")
      end
      it '炭水化物が必須であること' do
        @food.carbohydrate = ''
        @food.valid?
        expect(@food.errors.full_messages).to include("Carbohydrate can't be blank")
      end
      it 'カロリーが必須であること' do
        @food.calorie = ''
        @food.valid?
        expect(@food.errors.full_messages).to include("Calorie can't be blank")
      end
      it 'カロリーは整数以外では登録できない' do
        @food.calorie = '1989.5'
        @food.valid?
        expect(@food.errors.full_messages).to include("Calorie must be an integer")
      end
      it 'userが紐付いていなければ登録できない' do
        @food.user = nil
        @food.valid?
        expect(@food.errors.full_messages).to include("User must exist")
      end
    end
  end
end
