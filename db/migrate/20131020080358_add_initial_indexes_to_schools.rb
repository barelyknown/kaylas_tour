class AddInitialIndexesToSchools < ActiveRecord::Migration
  def change
    add_index :schools, :ipeds_id
    add_index :schools, :name
  end
end
