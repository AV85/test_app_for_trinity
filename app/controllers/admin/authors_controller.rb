class Admin::AuthorsController < ApplicationController
  before_action :set_author, only: [:show, :edit, :update, :destroy]

  def index
    @authors = Author.all
  end

  def show; end

  def new
    @author = Author.new
  end

  def edit; end

  def create
    @author = Author.new(author_params)
    @books = Book.where(id: params[:id])
    @author.books << @books
    respond_to do |format|
      if @author.save
        format.html { redirect_to admin_authors_path, notice: 'Author was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @author.update(author_params)
        format.html { redirect_to admin_authors_path, notice: 'Author was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @author.destroy
    respond_to do |format|
      format.html { redirect_to admin_authors_path, notice: 'Author was successfully destroyed.' }
    end
  end

  private

  def set_author
    @author = Author.find(params[:id])
  end

  def author_params
    params.require(:author).permit(:name, book_ids: [])
  end
end
