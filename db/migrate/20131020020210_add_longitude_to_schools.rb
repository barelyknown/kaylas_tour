class AddLongitudeToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :longitude, :decimal
  end
end
