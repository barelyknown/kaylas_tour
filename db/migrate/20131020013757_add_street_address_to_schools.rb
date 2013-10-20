class AddStreetAddressToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :street_address, :string
  end
end
