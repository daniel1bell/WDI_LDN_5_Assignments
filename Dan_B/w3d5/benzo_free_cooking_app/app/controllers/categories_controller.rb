class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @category }
    end
  end

  def create
    @category = Category.create(params[:category])

    redirect_to(categories_path)
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])

    respond_to do |format|
      if @category.update_attributes(params[:category])
        format.html { redirect_to categories_path, notice: 'Engine was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end



  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    redirect_to(categories_path)
  end

end
