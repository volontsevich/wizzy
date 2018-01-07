source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.2'
gem 'pg'
gem 'figaro'
gem 'puma', '~> 3.0'
gem 'puma_worker_killer'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'

# Backup
gem 'whenever', require: false
gem 'gon', '~> 6.0', '>= 6.0.1'

# Authentication and Authorization
gem 'devise'
gem 'pundit'

# Active Admin
gem 'activeadmin', github: 'activeadmin'
gem 'active_admin_import' , github: 'activeadmin-plugins/active_admin_import'
gem 'active_admin_datetimepicker'
gem 'geokit-rails'
gem 'amcharts.rb'
gem 'selectize-rails'
gem 'timelineJS3-rails', '~> 1.0.0'

# PDF
gem 'wicked_pdf'
gem 'wkhtmltopdf-binary'
gem 'pdfunite'


# Trb
gem 'trailblazer-rails'
gem 'cells-rails'
gem 'cells-erb'
gem 'trailblazer-cells'

# Vue js
gem 'vuejs-rails'

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