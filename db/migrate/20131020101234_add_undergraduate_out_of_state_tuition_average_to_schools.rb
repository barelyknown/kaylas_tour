class AddUndergraduateOutOfStateTuitionAverageToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :undergraduate_out_of_state_tuition_average, :integer
  end
end
