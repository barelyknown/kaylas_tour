class AddIndexesToVideos < ActiveRecord::Migration
  def change
    add_index :videos, :videoed_type
    add_index :videos, :videoed_id
    add_index :videos, :youtube_id
    add_index :schools, :football_conference
    add_index :schools, :city
  end
end
