class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :url
      t.string :videoed_type
      t.integer :videoed_id
      t.boolean :featured

      t.timestamps
    end
  end
end
