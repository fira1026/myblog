# README

This is my first time to build a blog by Rails, and this blog is for demo purpose.


### Day 1

1. 設定 Rails 運行環境
2. 建立 myblog 空專案，將 myblog 推至 github
3. 將 myblog 布署至 Heroku

### Day 2

1. 建立 models: Author, Post, Comment
2. 建立並載入 fixtures
3. 新增首頁及 About 頁面

### Day 3

1. 建立 controllers/views: Author, Post, Comment
2. 文章列表/文章詳情/作者列表/作者詳情
3. 建立文章/修改文章/刪除文章 (尚末綁權限)
4. Navigator bar
5. 修改作家個人資料 (尚未綁權限)
6. 作家詳情/該作家的文章列表
7. 註冊成為作家
8. 完成列表分頁功能

### 待處理事項

1. 作家登入/登出
2. 建立/修改文章 需綁定作家身份
3. 只能修改自己的個人資料
4. 為文章寫評論 (可匿名，不需權限，建立後不可修改)
5. 文章詳情中顯示所有關聯的評論
6. 改由 Facebook 註冊登入

### Deploy to Heroku

1. heroku create
2. git push heroku main:main
3. heroku rake db:migrate
4. heroku run rails db:fixtures:load

### References

[Install Ruby 3.0 · macOS Big Sur or Catalina](https://mac.install.guide/ruby/index.html)

[Getting Started with Rails](https://guides.rubyonrails.org/getting_started.html)

[Getting Started on Heroku with Rails 6.x](https://devcenter.heroku.com/articles/getting-started-with-rails6)

[Ruby on Rails: Switch from sqlite3 to Postgres](https://medium.com/@thorntonbrenden/ruby-on-rails-switch-from-sqlite3-to-postgres-590009645c25)

[How to Build a Blog with Ruby on Rails](https://deallen7.medium.com/ruby-on-rails-app-build-blog-3d9975a999ae#aecc)

[為你自己學 Ruby on Rails (電子書)](https://railsbook.tw/)

[Rails models cheatsheet](https://devhints.io/rails-models)
