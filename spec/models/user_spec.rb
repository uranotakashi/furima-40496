require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.new(
      nickname: 'test_nickname',
      email: 'test@example.com',
      password: 'test1234',
      password_confirmation: 'test1234',
      chinese_character_last_name: '山田',
      chinese_character_first_name: '太郎',
      katakana_last_name: 'ヤマダ',
      katakana_first_name: 'タロウ',
      date_of_birth: '2000-01-01'
    )
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameがあれば登録できる' do
        @user.nickname = 'test_nickname'
        expect(@user.valid?).to eq true
      end

      it 'emailがあれば登録できる' do
        @user.email = 'test@example.com'
        expect(@user.valid?).to eq true
      end

      it 'passwordがあれば登録できる' do
        @user.password = 'test1234'
        @user.password_confirmation = 'test1234'
        expect(@user.valid?).to eq true
      end

      it 'passwordとpassword_confirmationが一致していれば登録できる' do
        @user.password = 'test1234'
        @user.password_confirmation = 'test1234'
        expect(@user.valid?).to eq true
      end

      it 'emailが一意であれば登録できる' do
        @user.save
        another_user = User.new(
          nickname: 'test_nickname',
          email: 'different@example.com',
          password: 'test1234',
          password_confirmation: 'test1234',
          chinese_character_last_name: '山田',
          chinese_character_first_name: '太郎',
          katakana_last_name: 'ヤマダ',
          katakana_first_name: 'タロウ',
          date_of_birth: '2000-01-01'
        )
        expect(another_user.valid?).to eq true
      end

      it 'emailが@を含んでいれば登録できる' do
        @user.email = 'test@example.com'
        expect(@user.valid?).to eq true
      end

      it 'passwordが6文字以上であれば登録できる' do
        @user.password = 'test1234'
        @user.password_confirmation = 'test1234'
        expect(@user.valid?).to eq true
      end

      it 'passwordが半角英数字混合であれば登録できる' do
        @user.password = 'test1234'
        @user.password_confirmation = 'test1234'
        expect(@user.valid?).to eq true
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
      
      it 'katakana_first_nameが空では登録できない' do
        @user.katakana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Katakana first name can't be blank")
      end
      
      it 'date_of_birthが空では登録できない' do
        @user.date_of_birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Date of birth can't be blank")
      end
    end
  end
end