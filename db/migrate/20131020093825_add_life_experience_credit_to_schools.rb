class AddLifeExperienceCreditToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :life_experience_credit, :boolean
  end
end
