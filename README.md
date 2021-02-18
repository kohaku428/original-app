# original-app

*original-app*は自宅で髪を切りたい人と美容師をマッチングさせるアプリです。

## 概要

* ユーザー登録後、美容師一覧から美容師を選択することで  外出せずに、ヘアーカットサービスを予約することができます。

## 目指した課題解決

* お年寄り・障がい者の方・妊婦さんなどは、介護を必要とするゆえに、美容室やサロンを訪れることができません。  そこで、訪問美容師が一覧に集められたサイトで予約を簡単にすることができるサービスです。

## 制作背景（意図）

* 美容師である母から「足が不自由になってしまい、今までのように美容室に通うことが難しくなったお客様がいる」という話を聞きました。  そこで、実際に自宅へ訪問し髪を切ってあげたいという母の思いと、外出せずに髪を切ってもらいたいというお客様を簡単にマッチングできるアプリがあれば、このような問題が解決できると考えました。  さらにご年配の利用者ということを想定し、訪問美容師を簡単に予約できるというシンプルな機能のみとしました。

## 接続先情報

* URL:
* ID/Pass
 * ID: admin
 * Pass: 2222
* テスト用アカウント等
 * 依頼者用
   * メールアドレス: a@a
   * パスワード: test11
 * 美容師用
   * メールアドレス名: i@i
   * パスワード: test11

## 使い方

* WebブラウザGoogle Chromeの最新版を利用してアクセスしてください。
 * ただしデプロイ等で接続できないタイミングもございます。その際は少し時間をおいてから接続してください。
* 接続先およびログイン情報については、上記の通りです。
* 同時に複数の方がログインしている場合に、ログインできない可能性があります。
* テストアカウントでログイン→トップページから美容師登録ボタン押下→美容師情報入力→美容師登録
* 確認後、ログアウト処理をお願いします。

## デモ




## 使用技術（開発環境）

* バックエンド

  * Ruby, Ruby on Rails 

* データベース

  * MySQL, SequelPro

* インフラ

  *

* Webサーバー

  *

* アプリケーションサーバー

  *

* ソース管理

  * GitHub

* エディタ

  * VSCode

## 今後実装したい機能

* 地域検索機能

  * 住む地域別に美容師を探すことができる検索機能

## テーブル設計

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
