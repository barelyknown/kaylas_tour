# Load DSL and Setup Up Stages
require 'capistrano/setup'

# Includes default deployment tasks
require 'capistrano/deploy'

# Other deployment tasks
require 'capistrano/bundler'
require 'capistrano/rails/migrations'
require 'capistrano/rails/assets'


# Loads custom tasks from `lib/capistrano/tasks' if you have any defined.
Dir.glob('lib/capistrano/tasks/*.cap').each { |r| import r }