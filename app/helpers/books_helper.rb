module BooksHelper
  def book_name(id)
    Author.find(id).name
  end
end
