class AddDualCreditToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :dual_credit, :boolean
  end
end
