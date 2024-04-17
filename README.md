## usersテーブル

|Column                      |Type   |Options|
-------------------------------------------
|email                       |string |null: false|メール
|encrypted_password          |string |null: false|パスワード  
|nickname                    |string |null: false|ニックネーム
|chinese_character_last_name |string |null: false|漢字・名字
|chinese_character_first_name|string |null: false|漢字・氏名      
|katakana_last_name          |string |null: false|カタカナ・苗字
|katakana_first_name         |string |null: false|カタカナ・氏名
|date_of_birth               |date   |null: false|生年月日

### Association
has_many    :items
has_many    :purchase



## itemsテーブル

| Column         | Type    | Options                                           |
|----------------|---------|---------------------------------------------------|
|item_name       |string   |null: false,                                       |商品名
|description     |text     |null: false,                                       |商品説明
|category_id     |string   |null: false,                                       |カテゴリー
|situation_id    |string   |null: false,                                       |商品の状態
|shipping_fee_id | integer | null: false,                                      |配送料の負担
|delivery_area_id| integer | null: false,                                      |発送元の地域
|delivery_date_id| integer | null: false,                                      |発送までの日数
|seller_id       |string   |null: false,                                       |販売者
|price_id        |integer  |null: false,                                       |価格
|user_ID         |integer  |t.references :user, null: false, foreign_key: true |


### Association
belong_to :user
has_one_to:purchase



## purchasesテーブル

| Column | Type    | Options                        |
|--------|---------| ------------------------------ |
|user_id | string  |t.references :user, null: false, foreign_key: true  |
|items_id| string  |t.references :user, null: false, foreign_key: true  |
|purchase| integer | null: false,                                       |購入済み・未

### Association
- belongs_to :user
- belongs_to :item
- has_one_to :shipping address


## shipping_addressesテーブル

| Column         | Type   | Options                        |
|----------------|--------| ------------------------------ |
|zip_code        |integer | null: false,                   |郵便番号
|prefecture      |integer | null: false,                   |都道府県
|city            |string  | null: false,                   |市区町村  
|house_number    |integer | null: false,                   |番地
|Building_Name   |string  | null: false,                   |建物名
|telephone_number|integer | null: false,                   |電話番号
### Association
- belongs_to :purchase


