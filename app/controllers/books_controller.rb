class BooksController < ApplicationController
  load_and_authorize_resource
  def index
    @books = Book.where({:title.matches => "%#{params[:search]}%"} | {:description.matches => "%#{params[:search]}%"}).all
    @title = "Listado de Libros"
    @header = @title
  end

  def show
    @book = Book.find(params[:id])
    @title = "Detalle de Libro"
    @header = @title
  end

  def new
    @book = Book.new
    @title = "Nuevo Libro"
    @header = @title
    3.times { @book.authors.build }
    3.times { @book.copies.build }
  end

  def create
    @book = Book.new(params[:book])
    if @book.save
      flash[:notice] = "Libro creado exitosamente."
      redirect_to @book
    else
      render :action => 'new'
    end
  end

  def edit
    @book = Book.find(params[:id])
    @title = "Editar Libro"
    @header = @title
  end

  def update
    @book = Book.find(params[:id])
    if @book.update_attributes(params[:book])
      flash[:notice] = "Libro actualizado exitosamente."
      redirect_to book_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = "Libro eliminado exitosamente."
    redirect_to books_url
  end
end
