class AddSatMath25thPercentileToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :sat_math_25th_percentile, :integer
  end
end
