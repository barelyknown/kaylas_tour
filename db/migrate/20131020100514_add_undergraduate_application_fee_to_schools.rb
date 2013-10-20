class AddUndergraduateApplicationFeeToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :undergraduate_application_fee, :integer
  end
end
