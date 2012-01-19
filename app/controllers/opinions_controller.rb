class OpinionsController < ApplicationController
  # GET /opinions
  # GET /opinions.json
  def index
    @opinions = Opinion.order('id DESC').all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @opinions }
    end
  end

  # GET /opinions/new
  # GET /opinions/new.json
  def new
    @opinion = Opinion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @opinion }
    end
  end

  # POST /opinions
  # POST /opinions.json
  def create
    @opinion = Opinion.new(params[:opinion])
    unless @opinion.city.blank?
      result = Geocoder.search(@opinion.city).first
      @opinion.lat = result.latitude
      @opinion.lng = result.longitude
    end

    respond_to do |format|
      if @opinion.save
        format.html { redirect_to opinions_url, notice: 'Thank you for your opinion!' }
        format.json { render json: @opinion, status: :created, location: @opinion }
      else
        format.html { render action: "new" }
        format.json { render json: @opinion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /opinions/1
  # DELETE /opinions/1.json
  def destroy
    @opinion = Opinion.find(params[:id])
    @opinion.destroy

    respond_to do |format|
      format.html { redirect_to opinions_url }
      format.json { head :no_content }
    end
  end
end
