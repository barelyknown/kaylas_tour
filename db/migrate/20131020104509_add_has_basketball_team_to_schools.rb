class AddHasBasketballTeamToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :has_basketball_team, :boolean
  end
end
