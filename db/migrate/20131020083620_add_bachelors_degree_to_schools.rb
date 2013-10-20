class AddBachelorsDegreeToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :bachelors_degree, :boolean
  end
end
