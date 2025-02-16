module Api
  class RecipesController < ApplicationController
    protect_from_forgery with: :null_session  # Para permitir JSON en API sin autenticación

    before_action :set_recipe, only: [:show]

    def create
      json_body = JSON.parse(request.body.read)

      @recipe = Recipe.new(recipe_params)
      @recipe.user = User.first # Solo como ejemplo, asignamos la receta al primer usuario disponible
      
      if @recipe.save
        render json: @recipe, status: :created
      else
        render json: { errors: @recipe.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def index
      @recipes = Recipe.all
      render json: @recipes
    end

    def show
      render json: @recipe
    end

    def recipe_params
      params.require(:recipe).permit(:title, :description, :difficulty)
    end

    private

    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    
  end
end
