class AddIpedIdToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :iped_id, :string
  end
end
