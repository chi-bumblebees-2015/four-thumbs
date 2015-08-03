# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks


##This code came from Coderwall, the site
##for all the walls of codes:
##Source:
##https://coderwall.com/p/sdxxaa/travis-ci-don-t-know-how-to-build-task-default
task :default => :spec

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new

namespace :db do
  namespace :test do
    task :prepare => :environment do
      Rake::Task["db:seed"].invoke
    end
  end
end
