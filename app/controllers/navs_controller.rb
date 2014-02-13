class NavsController < ApplicationController
  # GET /navs
  # GET /navs.json
  def index
    @navs = Nav.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @navs }
    end
  end

  # GET /navs/1
  # GET /navs/1.json
  def show
    @nav = Nav.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @nav }
    end
  end

  # GET /navs/new
  # GET /navs/new.json
  def new
    @nav = Nav.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @nav }
    end
  end

  # GET /navs/1/edit
  def edit
    @nav = Nav.find(params[:id])
  end

  # POST /navs
  # POST /navs.json
  def create
    @nav = Nav.new(params[:nav])

    respond_to do |format|
      if @nav.save
        format.html { redirect_to @nav, notice: 'Nav was successfully created.' }
        format.json { render json: @nav, status: :created, location: @nav }
      else
        format.html { render action: "new" }
        format.json { render json: @nav.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /navs/1
  # PUT /navs/1.json
  def update
    @nav = Nav.find(params[:id])

    respond_to do |format|
      if @nav.update_attributes(params[:nav])
        format.html { redirect_to @nav, notice: 'Nav was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @nav.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /navs/1
  # DELETE /navs/1.json
  def destroy
    @nav = Nav.find(params[:id])
    @nav.destroy

    respond_to do |format|
      format.html { redirect_to navs_url }
      format.json { head :no_content }
    end
  end

  def featuredsort
    params[:nav].each_with_index do |id, index|
       Nav.update_all({position: index+1}, {id: id})
    end
    render nothing: true
  end


end
