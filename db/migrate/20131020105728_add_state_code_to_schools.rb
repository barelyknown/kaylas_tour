class AddStateCodeToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :state_code, :string
  end
end
