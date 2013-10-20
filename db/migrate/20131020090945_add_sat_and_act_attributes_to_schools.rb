class AddSatAndActAttributesToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :sat_reading_25th_percentile, :integer
    add_column :schools, :sat_reading_75th_percentile, :integer
    add_column :schools, :sat_math_75th_percentile, :integer
    add_column :schools, :sat_writing_25th_percentile, :integer
    add_column :schools, :sat_writing_75th_percentile, :integer
    add_column :schools, :act_composite_25th_percentile, :integer
    add_column :schools, :act_composite_75th_percentile, :integer
    add_column :schools, :act_english_25th_percentile, :integer
    add_column :schools, :act_english_75th_percentile, :integer
    add_column :schools, :act_math_25th_percentile, :integer
    add_column :schools, :act_math_75th_percentile, :integer
    add_column :schools, :act_writing_25th_percentile, :integer
    add_column :schools, :act_writing_75th_percentile, :integer
  end
end
