class AddSecondarySchoolRankRequirementToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :secondary_school_rank_requirement, :string
  end
end
