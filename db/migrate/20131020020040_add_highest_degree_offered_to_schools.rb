class AddHighestDegreeOfferedToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :highest_degree_offered, :string
  end
end
