class AddAdmissionsToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :admissions, :integer
  end
end
