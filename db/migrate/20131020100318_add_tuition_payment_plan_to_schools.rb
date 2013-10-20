class AddTuitionPaymentPlanToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :tuition_payment_plan, :boolean
  end
end
