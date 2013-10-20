class AddGeneralFaxNumberToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :general_fax_number, :string
  end
end
