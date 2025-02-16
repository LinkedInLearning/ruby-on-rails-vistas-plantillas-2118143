module Api
  class RecipesController < ApplicationController
    before_action :set_recipe, only: [:show]

    def index
      @recipes = Recipe.all
      render json: @recipes
    end

    def show
      render json: @recipe
    end

    private

    def set_recipe
      @recipe = Recipe.find(params[:id])
    end
  end
end
