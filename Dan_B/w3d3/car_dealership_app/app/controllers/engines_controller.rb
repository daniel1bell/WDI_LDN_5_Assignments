class EnginesController < ApplicationController


  def index
    @engines = Engine.all
  end

  def new
    @engine = Engine.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @engine }
    end
  end

  def edit
    @engine = Engine.find(params[:id])
  end

  def create
    @engine = Engine.create(params[:engine])

    redirect_to 'engines#index'
  end

  def update
    @engine = Engine.find(params[:id])

    redirect_to 'engines#index'
  end

  def destroy
    @engine = Engine.find(params[:id])
    @engine.destroy

    respond_to do |format|
      format.html { redirect_to 'engines#index' }
      format.json { head :no_content }
    end
  end

end