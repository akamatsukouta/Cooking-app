require 'rails_helper'

RSpec.describe User, type: :model do
   before do
    @user = FactoryBot.build(:user)
   end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '全ての項目(nickname, email, sex, cooking_experience, password, password_confirmation)が存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @user.password = 'asd678'
        @user.password_confirmation = 'asd678'
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationは半角英数字混合の場合登録できる' do
        @user.password = 'asd678'
        @user.password_confirmation = 'asd678'
        expect(@user).to be_valid
      end
      it 'emailは@がある場合のみ登録できる' do
        @user.email = 'test1@gmail.com'
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it 'nicknameが空欄の場合登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空欄の場合登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailに@がないと登録できない" do
        @user.email = 'test1gmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'sexが空の場合登録できない' do
        @user.sex = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Sex can't be blank")
      end
      it 'cooking_experienceがからの場合登録できない' do
        @user.cooking_experience = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Cooking experience can't be blank")
      end
      it 'passwordが空欄の場合登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'password英語のみでは登録できない' do
        @user.password = 'AAAAAA'
        @user.password_confirmation = 'AAAAAA'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordは数字のみでは登録できないこと' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordは全角では登録できないこと' do
        @user.password = 'あいうえお'
        @user.password_confirmation = 'あいうえお'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
    end
  end
end
