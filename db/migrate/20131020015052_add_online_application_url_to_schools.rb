class AddOnlineApplicationUrlToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :online_application_url, :string
  end
end
