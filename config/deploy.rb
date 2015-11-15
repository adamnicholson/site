set :repo_url, 'git@github.com:adamnicholson/site.git'
set :deploy_to, '/opt/adamnicholson.co.uk'

namespace :deploy do

  desc 'Build'
  task :build do
    on roles(:app) do
      within release_path do
        execute "composer install --no-dev --no-interaction --optimize-autoloader --working-dir=#{release_path}"
      end
    end
  end

  desc 'Restart'
  task :restart do
    on roles(:app) do
      execute "cp #{release_path}/nginx.conf #{deploy_to}/nginx.conf"
      execute "sudo service nginx reload"
      execute "sudo service php5-fpm reload"
    end
  end

  after :updating, :build
  after :updated, :restart

end
