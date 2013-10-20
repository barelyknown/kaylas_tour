class AddAcademicToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :academic, :boolean
  end
end
