class AddOccupationalToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :occupational, :boolean
  end
end
