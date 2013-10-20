class AddUndergraduateOfferingToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :undergraduate_offering, :string
  end
end
