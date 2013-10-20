class AddPostalCodeToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :postal_code, :string
  end
end
