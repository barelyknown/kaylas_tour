class AddHighestLevelOfOfferingToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :highest_level_of_offering, :string
  end
end
