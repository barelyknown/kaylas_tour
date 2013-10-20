class AddTotalPriceInStateOnCampusToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :total_price_in_state_on_campus, :integer
  end
end
