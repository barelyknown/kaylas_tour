class AddLevelOfInstitutionToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :level_of_institution, :string
  end
end
