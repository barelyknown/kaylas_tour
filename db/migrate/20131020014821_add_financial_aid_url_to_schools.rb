class AddFinancialAidUrlToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :financial_aid_url, :string
  end
end
