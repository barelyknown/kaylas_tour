class AddUndergraduateBooksAndSuppliesToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :undergraduate_books_and_supplies, :integer
  end
end
