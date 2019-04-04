class AddBookIdToTags < ActiveRecord::Migration[5.2]
  def change
    add_column :tags, :book_id, :integer
  end
end
