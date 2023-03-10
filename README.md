# テーブル設計

## users テーブル
| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| first_name         | string  | null: false               |
| last_name          | string  | null: false               |
| first_name_kana    | string  | null: false               |
| last_name_kana     | string  | null: false               |
| birthday           | date    | null: false               |

### Association
- has_many :items
- has_many :purchases

## items テーブル
| Column         | Type       | Options                        |
| -------------- | ---------- | -------------------------------|
| item_name      | string     | null: false                    |
| price          | integer    | null: false                    |
| detail         | text       | null: false                    |
| postage_id     | integer    |  null: false                   |
| category_id    | integer    | null: false                    |
| states_id      | integer    | null: false                    |
| area_id        | integer    | null: false                    |
| sipping_day_id | integer    | null: false                    |
| user           | references | null: false, foreign_key: true |

### Association
- has_one :purchase
- belongs_to :user

## purchases テーブル
| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |

### Association
- has_one :order
- belongs_to :user
- belongs_to :item


## orders テーブル
| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postcode       | string     | null: false                    |
| area_id        | integer    | null: false                    |
| municipalities | string     | null: false                    |
| address        | string     | null: false                    |
| building       | string     |                                |
| phone_number   | string     | null: false                    |
| purchase       | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase