class AddCalendarSystemToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :calendar_system, :string
  end
end
