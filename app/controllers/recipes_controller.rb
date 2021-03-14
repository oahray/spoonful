# frozen_string_literal: true

class RecipesController < ApplicationController
  include RecipesHelper
  before_action :set_recipe, only: %i[show]

  def index
    @recipes = Recipe.all.skip(skip).limit(limit).load
    @total_recipes = @recipes.total
    @total_pages = total_pages(@total_recipes)
    @page = page
  end

  def show; end

  private

  def set_recipe
    @recipe ||= Recipe.find(params[:id])

    route_not_found if @recipe.blank?
  end
end
