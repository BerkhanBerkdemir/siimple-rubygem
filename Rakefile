require 'bundler/gem_tasks'

desc 'Update siimple from upstream'
task :update do
  require './tasks/updater'
  Updater.new().update
  Updater.new().clean
end
