class RenameIpedIdInSchools < ActiveRecord::Migration
  def change
    rename_column :schools, :iped_id, :ipeds_id
  end
end
