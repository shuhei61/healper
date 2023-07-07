# README

## usersテーブル
| Column             | Type       | Options                        |
|--------------------|------------|--------------------------------|
| nickname           | string     | null: false                    |
| email              | string     | null: false, unique: true      |
| encrypted_password | string     | null: false                    |
| gender_id          | integer    | null: false                    |
| age                | integer    | null: false                    |
| height             | integer    | null: false                    |
| weight             | integer    | null: false                    |
| level_id           | integer    | null: false                    |
| essential_cal      | integer    | null: false                    |

### Association
- has_many :calendars
- has_many :foods
- extend ActiveHash::Associations::ActiveRecordExtensions
-   belongs_to :gender
-   belongs_to :level

## foodsテーブル
| Column             | Type       | Options                        |
|--------------------|------------|--------------------------------|
| name               | string     | null: false                    |
| protein            | integer    | null: false                    |
| fat                | integer    | null: false                    |
| carbohydrate       | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :calendars, through: :calender_foods
- has_one_attached :image

## calendarsテーブル
| Column             | Type       | Options                        |
|--------------------|------------|--------------------------------|
| date               | date       | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :foods, through: :calender_foods

## calendar_foodsテーブル
| Column             | Type       | Options                        |
|--------------------|------------|--------------------------------|
| calendar           | references | null: false, foreign_key: true |
| food               | references | null: false, foreign_key: true |

### Association
- belongs_to :calendar
- belongs_to :food