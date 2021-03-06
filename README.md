Flashcards
==========
This is a web app to quiz yourself on the Ruby core methods. Select a Class or Module and quiz yourself. More languages will be added in the future.

Usage:
------
- Getting started:
  + clone the app.
  + cd into the directory.
  + using ruby 2.1.0 ( if using rbenv and you don't have this ruby, after installing, $: gem install bundler)
  + $: bundle.
  + This project is using [dotenv](https://github.com/bkeepers/dotenv) and requires that you create and set a secret token, admin email, key for Devise, and mailer address for Devise in your .env file.
    - Setting the secret key: Ex: inside .env -> SECRET_KEY = 'the generated secret key'.  You can generate a secret key using $: rake secret.
    - Setting the admin email: .env -> ADMIN_EMAIL = 'the email you want to be the admin email'
    - Setting the devise secret key: You can use $: rake secret to generate a secret key for devise. Store it in the .env file under the DEVISE_KEY = 'the generated devise key'.
    - Setting the devise mailer sender : If you are using this in development, you can set MAILER_SENDER = 'please-change-me-at-config-initializers-devise@example.com'
    - Setting the url for the emailer(production.rb): EMAIL_HOST = ' your_url'
  + $: rake db:migrate
  + $: rake db:seed ( when a window pops up to confirm your account, just close the window.  The account has been conformed programmatically.  This applies only to running the seeds file. If you add users manually through the app, you will need to click the confirm link.)

- To run the app:
  + start the server. $: rails server
  + navigate to localhost:3000
  + sign in with test_user@testuser.com , password "password"(which was created when running the seeds.)
  + There is an admin panel to add terms/ definitons to the app that lives at /cards.  This can only be accessed if you are logged in with the admin email that was set in the .env file. You will need to create an account for that email address. The cards panel was build using scaffolding(the only thing that was) but was tweaked. The decision to use RDoc was retracted due to inconsistencies in the generated output and the fact that using this panel to add the terms/ definitions is a good first step of becoming familiar with what exists in a language.

- To run the specs:
  + follow the steps for getting started.
  + $: rake db:test:prepare
  + $: rspec

- Future plans:
  + The first release will feature Ruby only, but as you can see from running the app has functionality to support other languages.
  + If you search the project for TODO you will see where there are plans for graphs, charts, etc.
  + Styling. Currently, the app is using a foundation template which has been tweaked slightly.  There are plans to style it more fully once I get it launched privately before I release it publicly.  My priority is to get it up privatly so that I can begin adding terms/ defintions and to be able to test it out when it's live.
