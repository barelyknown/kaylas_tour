class AddRecommendationsRequirementToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :recommendations_requirement, :string
  end
end
