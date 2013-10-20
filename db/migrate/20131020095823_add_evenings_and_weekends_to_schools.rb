class AddEveningsAndWeekendsToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :evenings_and_weekends, :boolean
  end
end
