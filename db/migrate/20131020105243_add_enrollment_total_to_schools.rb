class AddEnrollmentTotalToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :enrollment_total, :integer
  end
end
