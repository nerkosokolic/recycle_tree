require 'active_record'

options = {
  adapter: 'postgresql',
  database: 'recycle_tree'
}

ActiveRecord::Base.establish_connection(options)