require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品ができるとき' do

      it '商品画像を1枚つけることが必須であること。商品名が必須であること。商品の説明が必須であること。カテゴリーの情報が必須であること。商品の状態の情報が必須であること。配送料の負担の情報が必須であること。発送元の地域の情報が必須であること。発送までの日数の情報が必須であること。 価格の情報が必須であること。価格は、¥300~¥9,999,999の間のみ保存可能であること。価格は半角数値のみ保存可能であること。' do
        expect(@item).to be_valid
      end
    end

    context '商品出品ができないとき' do
      it '商品画像が1枚なければ登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it 'descriptionが空では登録できない' do
        @item.description  = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'categoryが空では登録できない' do
        @item.category_id  = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'situationが空では登録できない' do
        @item.situation_id  = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Situation can't be blank")
      end

      it 'shipping feeが空では登録できない' do
        @item.shipping_fee_id  = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
      end

      it 'delivery areaが空では登録できない' do
        @item.delivery_area_id  = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery area can't be blank")
      end

      it 'delivery dateが空では登録できない' do
        @item.delivery_date_id  = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery date can't be blank")
      end

      it 'priceが空では登録できない' do
        @item.price  = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが299以下では登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it'priceが10,000,000以上では登録できない'do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

      it '価格は半角アルファベットでは登録できない' do
        @item.price = 'abc'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it '価格は全角数字では登録できない' do
        @item.price = '１２３４'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

it 'categoryが初期値では登録できない' do
  @item.category_id = '1'
  @item.valid?
  expect(@item.errors.full_messages).to include('Category can\'t be blank')
end

it 'situationが初期値では登録できない' do
  @item.situation_id = '1'
  @item.valid?
  expect(@item.errors.full_messages).to include('Situation can\'t be blank')
end

it 'shipping feeが初期値では登録できない' do
  @item.shipping_fee_id = '1'
  @item.valid?
  expect(@item.errors.full_messages).to include('Shipping fee can\'t be blank')
end

it 'delivery areaが初期値では登録できない' do
  @item.delivery_area_id = '1'
  @item.valid?
  expect(@item.errors.full_messages).to include('Delivery area can\'t be blank')
end

it 'delivery dateが初期値では登録できない' do
  @item.delivery_date_id = '1'
  @item.valid?
  expect(@item.errors.full_messages).to include('Delivery date can\'t be blank')
end

    end
  end
end