set :repo_url, 'git@github.com:adamnicholson/site.git'
set :deploy_to, '/opt/adamnicholson.co.uk'

namespace :deploy do

  desc 'Restart'
  task :restart do
    on roles(:app) do
      execute "cp #{release_path}/nginx.conf #{deploy_to}/nginx.conf"
      execute "sudo service nginx reload"
      execute "sudo service php5-fpm reload"
    end
  end

  after :updated, :restart

end
