class AddOpenToTheGeneralPublicToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :open_to_the_general_public, :boolean
  end
end
