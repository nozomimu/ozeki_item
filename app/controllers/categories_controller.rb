class CategoriesController < ApplicationController
  def index
  	@category = Category.all
  end

  def new
  end

  def edit
  end
end
