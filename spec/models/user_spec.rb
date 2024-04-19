require 'rails_helper'

RSpec.describe User, type: :model do

  def valid_user
    FactoryBot.build(:user,
                     nickname: "test_nickname",
                     email: "test@example.com",
                     password: "test1234",
                     password_confirmation: "test1234",
                     date_of_birth: "2000-01-01",
                     chinese_character_last_name: "山田",
                     chinese_character_first_name: "太郎",
                     katakana_last_name: "ヤマダ",
                     katakana_first_name: "タロウ")
  end

  before do
    @user = valid_user
  end

  describe 'ユーザー新規登録' do

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
      another_user = valid_user
      another_user.email =  'different@example.com'
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
    
   
    it 'passwordが半角英数字混合であること' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'passwordが半角英数字混合であること' do
      @user.password = 'abcdef'
      @user.password_confirmation = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
  end
end



