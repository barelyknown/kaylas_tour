class AddStudyAbroadToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :study_abroad, :boolean
  end
end
