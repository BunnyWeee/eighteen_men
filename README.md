# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
  ruby 2.6.3p62 (2019-04-16 revision 67580)
  Rails 5.2.3
  PostgreSQL 11.5
* Deployment instructions
  1. 先申請 Heroku 的帳號，
  2. 安裝 Heroku Cli，可參考 Heroku 官網提供的教學
     https://devcenter.heroku.com/articles/heroku-cli
  3. 在終端機進入你的專案
     ```
     $ heroku login  # 登入你的 heroku
     ```
  4. Heroku 平台是使用 Git 來進行部署，所以確定你的專案版控為 Git。
     如果第一次使用，可先在專案目錄下：
     ```
     $ git init    # 進行初始化，也讓你的專案加入至 Git 版控。
     ```
  5. 再來我們需要部署的伺服器，請先執行：
     ```
     $ heroku create  # 這邊做的是在 Heroku上開一台伺服器，沒有指定名稱的話，會隨機賦予。
     or
     $ heroku create HappyHacking666  # 如果此名稱未使用，那你的機器就叫做 HappyHacking666
     ```
  6. 機器開好了，那我們當然要來登入一下遠端節點：
     ```
     $ git remote add heroku https://git.heroku.com/HappyHacking666.git
     ```
  7. 可以輸入 `git remote -v` 來確認一下節點的狀態，接下來我們就要把專案推上 Heroku 上了：
     ```
     $ git push heroku master  # 這裡就會開始進行部署，看到 remote: Verifying deploy.... done. 這行就可以安心了。
     ```
  8. 最後，老規矩，別忘了要 db:migrate
     ```
     $ heroku run db:migrate  # 因為我們要做這個動作的是在 Heroku 上的專案，所以需要在前面添加 heroku run 來執行動作。
     ```
  9. You're done. 開瀏覽器去看你的專案吧！