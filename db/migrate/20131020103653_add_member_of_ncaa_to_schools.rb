class AddMemberOfNcaaToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :member_of_ncaa, :boolean
  end
end
