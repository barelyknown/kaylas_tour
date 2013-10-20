class AddMissionStatementUrlToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :mission_statement_url, :string
  end
end
