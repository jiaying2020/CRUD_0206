class BooksController < ApplicationController
before_action :find_book, only:[:edit,:update,:destroy]

    def index 
        @books =Book.all
    end

    def new 
     @book = Book.new
    end

    def create 
        @book = Book.new(book_params)
        if @book.save 
        redirect_to books_path, notice:"已新增成功" 
        else
        render :new
        end
    end

    def edit
    end

    def update 
        
        if @book.update(book_params)
            redirect_to books_path, notice:"已修改成功" 
            else
            render :edit
            end
    end

    def  destroy
        @book.destroy if @book
        redirect_to books_path, notice:"已刪除" 
    end
    
    private

    def find_book 
        @book = Book.find_by(id:params[:id])
    end
    def book_params
        params.require(:book).permit(:title,:price)
    end
    
end
