class AddOpenAdmissionsToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :open_admissions, :boolean
  end
end
