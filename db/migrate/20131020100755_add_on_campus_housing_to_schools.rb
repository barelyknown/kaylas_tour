class AddOnCampusHousingToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :on_campus_housing, :boolean
  end
end
