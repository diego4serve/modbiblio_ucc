class UsersController < ApplicationController
  load_and_authorize_resource

  def new
    @user = User.new
    @title = "Registrese"
    @header = @title
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url, :notice => "Registro Exitoso!"
    else
      render "new"
    end
  end

  def edit
    @user = User.find(params[:id])
    @title = "Editar usuario"
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'Usuario modificado exitosamente') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def show
    @user = User.find(params[:id])
    @title = "Detalle de usuario"
    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def index
    @users = User.all
    @title = "Listado de Usuarios"
    respond_to do |format|
      format.html # index.html.erb
    end
  end
end

