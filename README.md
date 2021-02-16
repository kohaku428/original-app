# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |

### Association

- has_one : hairdresser
- has_many : appointments

## hairdressers テーブル

| Column     | Type       | Options           |
| --------   | ---------- | ----------------- |
| name       | string     | null: false       |
| profile    | text       | null: false       |
| user       | references | foreign_key: true |

### Association

- belongs_to :user
- has_many : appointments

## appointments テーブル

| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| user        | references | foreign_key: true |
| hairdresser | references | foreign_key: true |

### Association

- belongs_to :hairdresser
- belongs_to :user