class AddAdmissionsUrlToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :admissions_url, :string
  end
end
