class AddUndergraduatePercentReceivingFinancialAidToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :undergraduate_percent_receiving_financial_aid, :float
  end
end
