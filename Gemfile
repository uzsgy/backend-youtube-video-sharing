source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"
gem "rails", "~> 7.0.4", ">= 7.0.4.3"
gem "mysql2", "~> 0.5"
gem "puma", "~> 5.0"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
gem "paranoia", "~> 2.6", ">= 2.6.2"
gem "faker", "~> 3.2"
gem "bcrypt", "~> 3.1", ">= 3.1.19"
gem "ransack", "~> 4.0"
gem "kaminari", "~> 1.2", ">= 1.2.2"
gem "yt", "~> 0.33.4"
gem "omniauth-google-oauth2"
gem "dotenv-rails", "~> 2.1", ">= 2.1.1"
gem "google-api-client"

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "rspec-rails", "~> 6.0", ">= 6.0.3"
  gem "pry-rails", "~> 0.3.9"
end
