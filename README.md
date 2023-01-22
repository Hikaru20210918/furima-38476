# テーブル設計

## users テーブル
| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false, unique: true |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false,              |
| encrypted_password | string  | null: false               |
| first_name         | text    | null: false               |
| last_name          | text    | null: false               |
| first_name_kana    | text    | null: false               |
| last_name_kana     | text    | null: false               |
| birthday           | integer | null: false               |

### Association
- has_many :items
- has_many :oders

## items テーブル
| Column      | Type      | Options       |
| ----------- | --------- | --------------|
| item_name   | string    | null: false   |
| price       | integer   | null: false   |
| postage     | boolean   | null: false   |
| detail      | text      | null: false   |
| seller      | string    | null: false   |
| category    | text      | null: false   |
| state       | text      | null: false   |
| area        | text      | null: false   |
| sipping_day | string    | null: false   |

### Association
- has_many :images
- has_one :oder


## images テーブル
| Column  | Type      | Options        |
| ------- | --------- | ---------------|
| image   | text      | null: false    |

### Association
belongs_to :item


## oder テーブル
| Column         | Type       | Options     |
| -------------- | ---------- | ----------- |
| postcode       | string     | null: false |
| prefectures    | string     | null: false |
| municipalities | string     | null: false |
| address        | string     | null: false |
| building       | string     |             |
| number         | integer    | null: false |

### Association
- belongs_to :user
- belongs_to :item
- has_one :purchase


## purchase テーブル
| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| buyer          | string  | null: false |
| item_name      | string  | null: false |

### Association
- belongs_to :oder