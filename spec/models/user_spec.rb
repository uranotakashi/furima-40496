require 'rails_helper'

RSpec.describe User, type: :model do
 
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do

      it 'nicknameが存在すれば登録できる。emailが存在すれば登録できる。passwordが存在すれば登録できるpasswordとpassword_confirmationが一致すれば登録できる。emailに@を含んでいると登録できる。passwordが6文字以上で登録できる。
      パスワードは半角数値混合の場合登録できる。chinese_character_last_nameとchinese_character_first_nameとkatakana_last_nameとkatakana_first_nameとdate_of_birthがすれば登録できる。' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'passwordが6文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'パスワードは半角数値のみの場合登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'パスワードは半角英字のみの場合登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordが全角だと登録できない' do
        @user.password = 'パスワード'
        @user.password_confirmation = 'パスワード'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'chinese_character_last_nameが空では登録できない' do
        @user.chinese_character_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Chinese character last name can't be blank")
      end
      
      it 'chinese_character_first_nameが空では登録できない' do
        @user.chinese_character_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Chinese character first name can't be blank")
      end
      
      it 'katakana_last_nameが空では登録できない' do
        @user.katakana_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Katakana last name can't be blank")
      end
      
      it 'katakana_last_nameがカタカナ以外の文字（ひらがなや漢字）では登録できない' do
        @user.katakana_last_name = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Katakana last name is invalid')
      end

      it 'katakana_first_nameが空では登録できない' do
        @user.katakana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Katakana first name can't be blank")
      end

      it 'katakana_first_nameがカタカナ以外の文字（ひらがなや漢字）では登録できない' do
        @user.katakana_first_name = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include('Katakana first name is invalid')
      end
      
      it 'date_of_birthが空では登録できない' do
        @user.date_of_birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Date of birth can't be blank")
      end
    end
  end
end