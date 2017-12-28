source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.6'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'

gem 'gon', '~> 6.0', '>= 6.0.1'

gem 'devise'
gem 'activeadmin', github: 'activeadmin'
gem 'active_admin_datetimepicker'
gem 'geokit-rails'
gem 'amcharts.rb'

# Trb
gem 'trailblazer-rails'
gem 'cells-rails'
gem 'cells-erb'
gem 'trailblazer-cells'

# Jobs
gem 'sidekiq'
gem 'sidekiq-failures'
gem 'sidekiq-batch'
gem 'sinatra', github: 'sinatra/sinatra', branch: 'master', require: false # for web ui



group :development, :test do
  gem 'byebug', platform: :mri
end

group :development do
  gem 'capistrano'
  gem 'capistrano3-puma'
  gem 'capistrano-rails', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-sidekiq'

  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'minitest-spec-rails'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'faker'
end
