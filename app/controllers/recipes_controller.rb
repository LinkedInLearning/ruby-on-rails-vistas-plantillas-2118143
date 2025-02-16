class RecipesController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :handle_invalid_record
  include BeanCounter
  
  def new
    @recipe = Recipe.new
    Bean.all.each { |bean| @recipe.recipe_beans.build(bean: bean) }
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = User.first # Solo como ejemplo, asignamos la receta al primer usuario disponible

    @recipe.save!

    redirect_to recipe_path(@recipe, from: "new", message: "Receta creada con éxito")
  end

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
    @bean_count = count_beans(@recipe)

    unless @recipe
      render file: "#{Rails.root}/public/404.html", layout: false, status: :not_found
    else
      respond_to do |format|
        format.html  
        format.json 
      end
    end 
  end

  def latest
    @recipes = Recipe.order(created_at: :desc).limit(5)
  end

  def roaster
    @recipe = Recipe.find_by(id: params[:id])
  end

  private

  def handle_invalid_record(exception)
    flash[:alert] = "Error: #{exception.record.errors.full_messages.join(', ')}"
    redirect_to new_recipe_path
  end

  def recipe_params
    params.require(:recipe).permit(:title, :description, :instructions, :difficulty, recipe_beans_attributes: [:bean_id, :amount, :_destroy])
  end
end