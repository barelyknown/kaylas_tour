class AddGeneralPhoneNumberToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :general_phone_number, :string
  end
end
