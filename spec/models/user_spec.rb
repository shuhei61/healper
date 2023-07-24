require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '必要な情報を適切に入力して「会員登録」ボタンを押すと、新規登録ができる' do
        expect(@user).to be_valid
      end
      it '身長は小数でも登録できる' do
        @user.height = '170.5'
        expect(@user).to be_valid
      end
      it '体重は小数でも登録できる' do
        @user.weight = '65.5'
        expect(@user).to be_valid
      end
      it '体脂肪率は小数でも登録できる' do
        @user.fat_body = '14.9'
        expect(@user).to be_valid
      end
    end

    context '新規登録ができない' do
      it 'ニックネームが必須であること' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'メールアドレスが必須であること' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'メールアドレスが一意性であること' do
        @user.save
        new_user = FactoryBot.build(:user)
        new_user.email = @user.email
        new_user.valid?
        expect(new_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'メールアドレスは、@を含む必要があること' do
        @user.email = 'mail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'パスワードが必須であること' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワードが6文字未満では登録できない' do
        @user.password = 'one11'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it '英字のみのパスワードでは登録できない' do
        @user.password = 'oneone'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end
      it '数字のみのパスワードでは登録できない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end
      it '全角文字を含むパスワードでは登録できない' do
        @user.password = 'ｏne111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end
      it 'パスワードとパスワード（確認）は、値の一致が必須であること' do
        @user.password = 'one111'
        @user.password_confirmation = 'one112'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '性別に「---」が選択されている場合は登録できない' do
        @user.gender_id = '1'
        @user.valid?
        expect(@user.errors.full_messages).to include("Gender can't be blank")
      end 
      it '年齢が必須であること' do
        @user.age = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Age can't be blank")
      end
      it '年齢は整数以外では登録できない' do
        @user.age = '30.1'
        @user.valid?
        expect(@user.errors.full_messages).to include("Age must be an integer")
      end
      it '身長が必須であること' do
        @user.height = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Height can't be blank")
      end
      it '体重が必須であること' do
        @user.weight = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Weight can't be blank")
      end
      it '活動レベルに「---」が選択されている場合は登録できない' do
        @user.level_id = '1'
        @user.valid?
        expect(@user.errors.full_messages).to include("Level can't be blank")
      end
      it '必須カロリーが必須であること' do
        @user.essential_cal = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Essential cal can't be blank")
      end
      it '必須カロリーは整数以外では登録できない' do
        @user.essential_cal = '1989.5'
        @user.valid?
        expect(@user.errors.full_messages).to include("Essential cal must be an integer")
      end
      it '体脂肪率が必須であること' do
        @user.fat_body = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Fat body can't be blank")
      end
    end
  end
end
