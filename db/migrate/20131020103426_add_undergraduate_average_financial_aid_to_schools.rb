class AddUndergraduateAverageFinancialAidToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :undergraduate_average_financial_aid, :integer
  end
end
