namespace :db do
  task :nuke do
    sh "rake db:drop:all db:create:all db:migrate"
  end
end
