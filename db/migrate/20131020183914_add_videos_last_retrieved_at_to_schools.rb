class AddVideosLastRetrievedAtToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :videos_last_retrieved_at, :datetime
  end
end
