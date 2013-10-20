class AddAllRemoteToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :all_remote, :boolean
  end
end
