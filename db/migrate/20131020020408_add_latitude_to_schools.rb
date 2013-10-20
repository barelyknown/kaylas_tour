class AddLatitudeToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :latitude, :decimal
  end
end
