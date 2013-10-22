
set :application, 'kaylas_tour'

set :scm, :git
set :repo_url, 'git@github.com:barelyknown/kaylas_tour.git'
set :branch, "digitalocean"
set :deploy_via, :remote_cache

set :bundle_flags, '--deployment'

set :deploy_to, '/home/smd/var/apps/kaylas_tour'

set :format, :pretty

desc "Check that we can access everything"
task :check_write_permissions do
  on roles(:all) do |host|
    if test("[ -w #{fetch(:deploy_to)} ]")
      info "#{fetch(:deploy_to)} is writable on #{host}"
    else
      error "#{fetch(:deploy_to)} is not writable on #{host}"
    end
  end
end

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  desc "reload the database with seed data"
  task :seed do
    on primary fetch(:migration_role) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, "db:seed"
        end
      end
    end
  end

  after :finishing, 'deploy:cleanup'

end
