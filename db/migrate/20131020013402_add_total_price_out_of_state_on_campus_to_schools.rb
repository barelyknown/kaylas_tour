class AddTotalPriceOutOfStateOnCampusToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :total_price_out_of_state_on_campus, :integer
  end
end
