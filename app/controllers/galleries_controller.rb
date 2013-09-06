class GalleriesController < ApplicationController
  before_filter :authenticate_admin!, :except => :show 
  # GET /galleries
  # GET /galleries.json
  def index
    @galleries = Gallery.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @galleries }
    end
  end

  # GET /galleries/1
  # GET /galleries/1.json
  def show
    @gallery = Gallery.find(params[:id])
    @curatings = Curating.where("gallery_id = ?", params[:id]).order("position").all

    @artworks = []
    @curatings.each do |curating|
      @artworks << Artwork.find_by_id(curating.artwork_id)
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gallery }
    end
  end

  # GET /galleries/new
  # GET /galleries/new.json
  def new
    @gallery = Gallery.new
    @all_artworks = Artwork.all
    @current_artworks = @gallery.artworks

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gallery }
    end
  end

  # GET /galleries/1/edit
  def edit
    @gallery = Gallery.find(params[:id])
    @all_artworks = Artwork.all
    @current_artworks = @gallery.artworks
  end

  # POST /galleries
  # POST /galleries.json
  def create
    params[:gallery][:artwork_ids] ||= [] 
    @gallery = Gallery.new(params[:gallery])

    respond_to do |format|
      if @gallery.save
        format.html { redirect_to @gallery, notice: 'Gallery was successfully created.' }
        format.json { render json: @gallery, status: :created, location: @gallery }
      else
        format.html { render action: "new" }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /galleries/1
  # PUT /galleries/1.json
  def update
    params[:gallery][:artwork_ids] ||= [] 
    @gallery = Gallery.find(params[:id])

    respond_to do |format|
      if @gallery.update_attributes(params[:gallery])
        format.html { redirect_to @gallery, notice: 'Gallery was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /galleries/1
  # DELETE /galleries/1.json
  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy

    respond_to do |format|
      format.html { redirect_to galleries_url }
      format.json { head :no_content }
    end
  end

  def sort
    #curatings = Curating.find_all_by_gallery_id(params[:id])
    params[:artwork].each_with_index do |id, index|
      Curating.update_all({position: index+1}, {gallery_id: params[:id], artwork_id: id})
    end
    render nothing: true
  end

  def featuredsort
    params[:gallery].each_with_index do |id, index|
       Gallery.update_all({position: index+1}, {id: id})
    end
    render nothing: true
    end
  end
