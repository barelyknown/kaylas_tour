class AddBasketballConferenceToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :basketball_conference, :string
  end
end
