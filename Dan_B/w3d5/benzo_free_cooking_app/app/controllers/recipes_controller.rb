class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
    @categories = Category.all
  end

  def show
    @recipe = Recipe.find(params[:recipe])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @recipe }
    end
  end

  def new
    @recipe = Recipe.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @recipe }
    end
  end

  def create
    @recipe = Recipe.create(params[:recipe])

    redirect_to(root_path)
  end

end
