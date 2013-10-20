class AddAdmissionsPercentageToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :admissions_percentage, :float
  end
end
