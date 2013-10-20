class AddReligousAffiliationToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :religous_affiliation, :string
  end
end
