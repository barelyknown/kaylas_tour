class AddSecondarySchoolRecordRequirementToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :secondary_school_record_requirement, :string
  end
end
