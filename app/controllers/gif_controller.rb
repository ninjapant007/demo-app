class GifController < ApplicationController

    def list
        @books = Gif.all
    end

    def show
        @book = Gif.find(params[:id])
    end

    def new 
        @book = Gif.new
        @subjects = Subject.all
    end

    def create
        @book = Gif.new(book_params)

        if @book.save
            redirect_to :action => 'list'
            render :action => 'new'
    end

    def book_params
        params.require(:books).permit(:title, :price, :subject_id, :description)
    end

    def edit
        @book = Gif.find(params[:id])
        @subjects = subject.all
    end

    def update
        @book = Gif.find(:params[:id])

        if @book.update_attributes(book_param)
            redirect_to :action => 'show', :id => @book
         else
            @subjects = Subject.all
            render :action => 'edit'
         end
        
    end

    def book_param
        params.require(:book).permit(:title, :price, :subject_id, :description)
     end
     

    def delete 
        Book.find(params[:id]).destroy
        redirect_to :action => 'list'
    end

end
