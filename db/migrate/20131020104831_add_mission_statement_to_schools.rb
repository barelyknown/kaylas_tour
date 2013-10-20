class AddMissionStatementToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :mission_statement, :text
  end
end
