class MerchandisesController < ApplicationController
  # GET /store_show_merchandise
  # GET /store_show_merchandise.xml
  def index
    @merchandise = Merchandise.page(params[:page]).per(3)

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @store_show_merchandise }
    end
  end

  # GET /store_show_merchandise/1
  # GET /store_show_merchandise/1.xml
  def show
    @merchandise = Merchandise.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @merchandise }
    end
  end

  # GET /store_show_merchandise/new
  # GET /store_show_merchandise/new.xml
  def new
    @merchandise = Merchandise.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @merchandise }
    end
  end

  # GET /store_show_merchandise/1/edit
  def edit
    @merchandise = Merchandise.find(params[:id])
  end

  # POST /store_show_merchandise
  # POST /store_show_merchandise.xml
  def create
    @merchandise = Merchandise.new(params[:merchandise])

    respond_to do |format|
      if @merchandise.save
        format.html { redirect_to(@merchandise, :notice => 'Merchandise was successfully created.') }
        format.xml { render :xml => @merchandise, :status => :created, :location => @merchandise }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @merchandise.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /store_show_merchandise/1
  # PUT /store_show_merchandise/1.xml
  def update
    @merchandise = Merchandise.find(params[:id])

    respond_to do |format|
      if @merchandise.update_attributes(params[:merchandise])
        format.html { redirect_to(@merchandise, :notice => 'Merchandise was successfully updated.') }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @merchandise.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /store_show_merchandise/1
  # DELETE /store_show_merchandise/1.xml
  def destroy
    @merchandise = Merchandise.find(params[:id])
    @merchandise.destroy

    respond_to do |format|
      format.html { redirect_to(merchandises_url) }
      format.xml { head :ok }
    end
  end
end
