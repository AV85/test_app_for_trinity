class CreateAuthorsBooksJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_table :authors_books, id: false do |t|
      t.belongs_to :author
      t.belongs_to :book
    end
  end
end
