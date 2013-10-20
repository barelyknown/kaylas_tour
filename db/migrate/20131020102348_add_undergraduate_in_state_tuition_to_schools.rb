class AddUndergraduateInStateTuitionToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :undergraduate_in_state_tuition, :integer
  end
end
