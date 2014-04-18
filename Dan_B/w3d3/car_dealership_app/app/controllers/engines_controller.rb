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

    redirect_to(engines_path)
  end

  def update
    @engine = Engine.find(params[:id])

    respond_to do |format|
      if @engine.update_attributes(params[:engine])
        format.html { redirect_to engines_path, notice: 'Engine was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @engine.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @engine = Engine.find(params[:id])
    @engine.destroy

    redirect_to(engines_path)
  end

end