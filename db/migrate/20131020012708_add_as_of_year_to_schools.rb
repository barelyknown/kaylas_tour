class AddAsOfYearToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :as_of_year, :integer
  end
end
