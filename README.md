## users名

|Column                      |Type   |Options|
-------------------------------------------
|user id                     |integer|null: false,|
|email                       |string |null: false,|      
|password                    |string |null: false,|
|nickname                    |string |null: false,|
|chinese character last name |string |null: false,|
|chinese character first name|string |null: false,|      
|katakana last name          |string |null: false,|
|katakana farst name         |string |null: false,|
|date of birth               |integer|null: false,|      

### Association
has many_to :items
has many_to :purchase
has one_to  :shipping address



## itemsテーブル

| Column    | Type  | Options                      |
|-----------|-------|------------------------------|
|item id    |integer|null: false,                  |
|item name  |string |null: false,                  |
|description|text   |null: false,                  |
|category   |string |null: false,                  |
|situation  |string |null: false,                  |
|seller     |string |null: false,                  |
|price      |integer|null: false,                  |
|user ID    |integer|null: false, foreign_key: true|


### Association
belong_to :users
has one_to:purchase



## purchaseテーブル

| Column | Type    | Options                        |
|--------|---------| ------------------------------ |
|user_id | string  | null: false, foreign_key: true |
|items_id| string  | null: false, foreign_key: true |
|purchase| integer | null: false,                   |

### Association
- belongs_to :users
- belongs_to :items
- has one_to :shipping address


## shipping addressテーブル

| Column      | Type    | Options                        |
|-------------|---------| ------------------------------ |
|user_id      | string  | null: false, foreign_key: true |
|item_id      | string  | null: false, foreign_key: true |
|shipping fee | integer | null: false,                   |
|delivery date| integer | null: false,     

### Association
- belongs_to :users
- belongs_to :purchase

