class RequestsController < ApplicationController
  # GET /requests
  # GET /requests.xml
  load_and_authorize_resource
  def index
    @requests = Request.all
    @title = "Listado de Solicitudes"
    @header = @title
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /requests/1
  # GET /requests/1.xml
  def show
    @request = Request.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /requests/new
  # GET /requests/new.xml
  def new
    @request = Request.new
    @title = "Reservar Libro"
    @header = @title
    @request.user = current_user
    @request.copy = Copy.find_by_code(params[:code])
    @request.request_date = Date.today

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /requests/1/edit
  def edit
    @request = Request.find(params[:id])
    @title = "Editar prestamo"
    @header = @title
  end

  # POST /requests
  # POST /requests.xml
  def create
    @request = Request.new(params[:request])
    @request_temp = Request.find(:all, :conditions => "copy_id ='#{@request.copy_id}' and request_date = '#{@request.request_date}'")

    if @request_temp.blank?
      respond_to do |format|
        if @request.save
          if @request.activated?
            format.html { redirect_to(@request, :notice => 'Prestamo realizado con exito.') }
          else
            format.html { redirect_to(@request, :notice => 'Reservacion realizada') }
          end
        else
          format.html { render :action => "new" }
        end
      end
    else
      flash[:error] = "Libro reservado para esa fecha"
      render :action => 'new'
    end
  end

  # PUT /requests/1
  # PUT /requests/1.xml
  def update
    @request = Request.find(params[:id])

    respond_to do |format|
      if @request.update_attributes(params[:request])
        format.html { redirect_to(@request, :notice => 'Prestamo actualizado.') }
      else
        format.xml  { render :xml => @request.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.xml
  def destroy
    @request = Request.find(params[:id])
    @request.destroy

    respond_to do |format|
      format.html { redirect_to(requests_url) }
    end
  end
end

