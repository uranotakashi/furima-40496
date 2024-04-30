require 'rails_helper'

RSpec.describe PurchaseShippingAddress, type: :model do
    before do
        @user = FactoryBot.create(:user)
        @item = FactoryBot.create(:item)
        @purchase_shipping_address = FactoryBot.build(:purchase_shipping_address, user: @user, item: @item)
    end

    describe '商品購入' do

        context '内容に問題ない場合' do
            it 'すべての値が正しく入力されていれば保存できること' do
                expect(@purchase_shipping_address).to be_valid
            end

            it 'building_nameは空でも保存できること' do
                @purchase_shipping_address.building_name = nil
                expect(@purchase_shipping_address).to be_valid
            end
        end

        context '内容に問題がある場合' do
            it 'zip_codeが空だと保存できないこと' do
                @purchase_shipping_address.zip_code = nil
                @purchase_shipping_address.valid?
                expect(@purchase_shipping_address.errors.full_messages).to include("Zip code can't be blank")
            end

              it 'zip_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
                @purchase_shipping_address.zip_code = '1234567'
                @purchase_shipping_address.valid?
                expect(@purchase_shipping_address.errors.full_messages).to include('Zip code is invalid. Enter it as follows (e.g. 123-4567)')
          
            end
            it 'delivery_area_idを選択していないと保存できないこと' do
                @purchase_shipping_address.delivery_area_id = 1
                @purchase_shipping_address.valid?
                expect(@purchase_shipping_address.errors.full_messages).to include('Delivery area must be selected')
            end

            it 'cityが空だと保存できないこと' do
                @purchase_shipping_address.city = nil
                @purchase_shipping_address.valid?
                expect(@purchase_shipping_address.errors.full_messages).to include("City can't be blank")
            end


            it 'house_numberが空だと保存できないこと' do
                @purchase_shipping_address.house_number = nil
                @purchase_shipping_address.valid?
                expect(@purchase_shipping_address.errors.full_messages).to include("House number can't be blank")
            end

            it 'telephone_numberが空だと保存できないこと' do
              @purchase_shipping_address.telephone_number = nil
              @purchase_shipping_address.valid?
              expect(@purchase_shipping_address.errors.full_messages).to include("Telephone number Phone number can't be blank")
            end
            
            it 'telephone_numberが10桁未満では保存できないこと' do
              @purchase_shipping_address.telephone_number = '123456789'
              @purchase_shipping_address.valid?
              expect(@purchase_shipping_address.errors.full_messages).to include('Telephone number Phone number is too short')
            end
            
            it 'telephone_numberが12桁以上では保存できないこと' do
              @purchase_shipping_address.telephone_number = '123456789012'
              @purchase_shipping_address.valid?
              expect(@purchase_shipping_address.errors.full_messages).to include('Telephone number Phone number is too long')
            end
            
            it 'telephone_numberにハイフンが含まれていると保存できないこと' do
              @purchase_shipping_address.telephone_number = '090-1234-5678'
              @purchase_shipping_address.valid?
              expect(@purchase_shipping_address.errors.full_messages).to include('Telephone number Phone number is invalid. Input only number')
            end

            it "tokenが空では登録できないこと" do
                @purchase_shipping_address.token = nil
                @purchase_shipping_address.valid?
                expect(@purchase_shipping_address.errors.full_messages).to include("Token can't be blank")
              end

        end
    end
end