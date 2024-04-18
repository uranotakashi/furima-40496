## usersテーブル

|Column                      |Type   |Options                 |
--------------------------------------------------------------|
|email                       |string |null: false,unique: true|メール
|encrypted_password          |string |null: false             |パスワード  
|nickname                    |string |null: false             |ニックネーム
|chinese_character_last_name |string |null: false             |漢字・名字
|chinese_character_first_name|string |null: false             |漢字・氏名      
|katakana_last_name          |string |null: false             |カタカナ・苗字
|katakana_first_name         |string |null: false             |カタカナ・氏名
|date_of_birth               |date   |null: false             |生年月日

### Association
has_many    :items
has_many    :purchases



## itemsテーブル

| Column         | Type        | Options                                          |
|----------------|-------------|--------------------------------------------------|
|item_name       |string       |null: false                                       |商品名
|description     |text         |null: false                                       |商品説明
|category_id     |integer      |null: false                                       |カテゴリー
|situation_id    |integer      |null: false                                       |商品の状態
|shipping_fee_id |integer      |null: false                                       |配送料の負担
|delivery_area_id|integer      |null: false                                       |発送元の地域
|delivery_date_id|integer      |null: false                                       |発送までの日数
|price           |integer      |null: false                                       |価格
|user            |references   | null: false, foreign_key: true                   |※外部キー


### Association
belong_to :user
has_one   :purchase



## purchasesテーブル

| Column | Type        | Options                        |
|--------|-------------| ------------------------------ |
|user    | references  | null: false, foreign_key: true |
|item    | references  | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one    :shipping_address


## shipping_addressesテーブル

| Column         | Type   | Options                        |
|----------------|--------| ------------------------------ |
|delivery_area_id|integer |null: false                     |発送元の地域
|zip code        |string  | null: false                    |郵便番号  
|city            |string  | null: false                    |市区町村  
|house_number    |string  | null: false                    |番地
|building_name   |string  |                                |建物名
|telephone_number|string  | null: false                    |電話番号
### Association
- belongs_to :purchase


