class AddAssociatesDegreeToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :associates_degree, :boolean
  end
end
