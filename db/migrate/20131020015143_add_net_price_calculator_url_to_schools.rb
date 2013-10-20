class AddNetPriceCalculatorUrlToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :net_price_calculator_url, :string
  end
end
