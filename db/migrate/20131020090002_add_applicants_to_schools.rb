class AddApplicantsToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :applicants, :integer
  end
end
