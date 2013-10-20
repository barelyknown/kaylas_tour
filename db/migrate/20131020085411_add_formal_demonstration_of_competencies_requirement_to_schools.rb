class AddFormalDemonstrationOfCompetenciesRequirementToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :formal_demonstration_of_competencies_requirement, :string
  end
end
