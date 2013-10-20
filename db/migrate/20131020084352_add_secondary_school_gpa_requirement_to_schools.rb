class AddSecondarySchoolGpaRequirementToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :secondary_school_gpa_requirement, :string
  end
end
