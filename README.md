# PainCaver


--- 
##### Features

  - Incorporates OAuth 2.0, VCR & Webmock Testing, SimpleCov Testing Analytics, Materialize CSS etc.
  
--- 
##### A personal effort from: [Steve Pentler](https://github.com/stevepentler)

###Setup

1. Copy .ruby-version.example to .ruby-version if you use a Ruby version manager such as RVM, rbenv or chruby
2. Install gems with: bundle
3. Create an application on the Strava developer site: http://labs.strava.com/developers/
Name: whatever
URL: http://127.0.0.1:3000
Callback url: http://127.0.0.1:3000/strava/callback
4. Presuming you have Postgres installed (if not: brew install postgres):
5. create database with: rake db:create
6. Run the database migrations with rake db:migrate db:test:prepare.
7. Run the database seed with rake db:seed. coming iteration
8. Start the server with rails s
9. Login at http://localhost:3000.