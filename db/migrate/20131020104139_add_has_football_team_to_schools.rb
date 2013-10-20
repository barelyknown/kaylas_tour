class AddHasFootballTeamToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :has_football_team, :boolean
  end
end
