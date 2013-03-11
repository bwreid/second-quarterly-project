class TanksController < ApplicationController
  before_filter :is_logged_in
  # GET /tanks
  # GET /tanks.json
  def index
    @tanks = Tank.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tanks }
    end
  end

  # GET /tanks/1
  # GET /tanks/1.json
  def show
    @tank = Tank.find( params[:id] )

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tank }
    end
  end

  # GET /tanks/new
  # GET /tanks/new.json
  def new
    @tank = Tank.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tank }
    end
  end

  # GET /tanks/1/edit
  def edit
    @tank = Tank.find(params[:id])
  end

  # POST /tanks
  # POST /tanks.json
  def create
    @tank = Tank.new(params[:tank])

    respond_to do |format|
      if @tank.save
        format.html { redirect_to @tank, notice: 'Tank was successfully created.' }
        format.json { render json: @tank, status: :created, location: @tank }
      else
        format.html { render action: "new" }
        format.json { render json: @tank.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tanks/1
  # PUT /tanks/1.json
  def update
    @tank = Tank.find(params[:id])

    respond_to do |format|
      if @tank.update_attributes(params[:tank])
        format.html { redirect_to @tank, notice: 'Tank was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tank.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tanks/1
  # DELETE /tanks/1.json
  def destroy
    @tank = Tank.find(params[:id])
    @tank.destroy

    respond_to do |format|
      format.html { redirect_to tanks_url }
      format.json { head :no_content }
    end
  end
end
