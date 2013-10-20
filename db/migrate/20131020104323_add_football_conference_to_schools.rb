class AddFootballConferenceToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :football_conference, :string
  end
end
