require 'rails_helper'

RSpec.describe Calendar, type: :model do
  before do
    @calendar = FactoryBot.build(:calendar)
  end

  describe 'カレンダー新規登録' do
    context '新規登録できるとき' do
      it '必要な情報を適切に入力して「保存」ボタンを押すと、新規登録ができる' do
        expect(@calendar).to be_valid
      end
    end

    context '新規登録ができない' do
      it '日付が必須であること' do
        @calendar.date = ''
        @calendar.valid?
        expect(@calendar.errors.full_messages).to include("Date can't be blank")
      end
      it 'userが紐付いていなければ登録できない' do
        @calendar.user = nil
        @calendar.valid?
        expect(@calendar.errors.full_messages).to include("User must exist")
      end
    end
  end
end
