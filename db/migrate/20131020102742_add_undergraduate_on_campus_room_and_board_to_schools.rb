class AddUndergraduateOnCampusRoomAndBoardToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :undergraduate_on_campus_room_and_board, :integer
  end
end
