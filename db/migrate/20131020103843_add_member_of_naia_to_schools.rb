class AddMemberOfNaiaToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :member_of_naia, :boolean
  end
end
