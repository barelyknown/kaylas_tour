class AddUndergraduateEnrollmentToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :undergraduate_enrollment, :integer
  end
end
