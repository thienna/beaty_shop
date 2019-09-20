source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "rails", "~> 5.1.4"
gem "puma", "~>3.7"
gem "config"
gem "bcrypt", "3.1.11"
gem "bootstrap-sass", "3.3.7"
gem "sass-rails", "5.0.6"
gem "uglifier", "3.2.0"
gem "jquery-rails", "4.3.1"
gem "turbolinks", "5.0.1"
gem "jbuilder", "2.7.0"
gem "faker"
gem "carrierwave", "1.1.0"
gem "mini_magick", "4.9.4"
gem "momentjs-rails", ">= 2.17.1"
gem "i18n-js"
gem "devise"
gem "mysql2"
gem "font-awesome-sass", "~> 4.7.0"
gem "jquery-ui-rails"
gem "wow-rails"
gem "kaminari"
gem "ckeditor"
gem "ransack"
gem "activerecord-import"

group :development, :test do
  gem "sqlite3", "1.3.13"
  gem "byebug",  "9.0.6", platform: :mri
  gem "capybara", "~> 2.13"
  gem "selenium-webdriver"
  gem "better_errors"
  gem "guard-rspec", require: false
  gem "database_cleaner"
  gem "brakeman", require: false
  gem "jshint"
  gem "bundler-audit"
  gem "rubocop", "~> 0.35.0", require: false
  gem "rubocop-checkstyle_formatter", require: false
  gem "scss_lint", require: false
  gem "scss_lint_reporter_checkstyle", require: false
  gem "eslint-rails"
  gem "rails_best_practices"
  gem "reek"
  gem "railroady"
  gem "autoprefixer-rails"
end

group :development do
  gem "pry"
  gem "web-console", "3.5.1"
  gem "listen", "3.0.8"
  gem "spring", "2.0.2"
  gem "spring-watcher-listen", "2.0.1"
end


group :test do
  gem "simplecov", require: false
  gem "simplecov-rcov", require: false
  gem "simplecov-json"
  gem "shoulda-matchers"
  gem "rails-controller-testing", "1.0.2"
  gem "minitest-reporters", "1.1.14"
  gem "guard", "2.13.0"
  gem "guard-minitest", "2.4.4"
end

group :production do
  gem "pg"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
