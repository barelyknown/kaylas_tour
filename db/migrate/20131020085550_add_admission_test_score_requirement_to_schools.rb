class AddAdmissionTestScoreRequirementToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :admission_test_score_requirement, :string
  end
end
