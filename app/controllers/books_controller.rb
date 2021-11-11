class BooksController < ApplicationController

	before_action :is_logged_in?

	def index
		@books = Book.all
	end

	def new
		@book = Book.new(title: nil)
	end

	def create
		@book = Book.new(resource_params);
		if @book.save
			flash[:notice] = "Book with ID #{@book.id} has been updated"
			redirect_to action: 'index'
		else
			render 'new'
		end
	end

	def show
		@book = Book.find(params[:id])
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
		@book = Book.find(params[:id])
		# @book.update(title: params[:book][:title], description: params[:book][:description] + " (edited)")
		@book.update(resource_params)

		redirect_to book_path(@book)
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to books_path
	end

	private

	def resource_params
		params.require(:book).permit(:title, :pages, :price, :description, :author_id)
	end
end
