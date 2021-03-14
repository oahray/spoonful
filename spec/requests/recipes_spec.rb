# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Recipes', type: :request do
  describe '#index' do
    it 'renders the index template' do
      get recipes_path
      expect(response).to render_template(:index)
    end

    it 'indicates when there is no recipe' do
      get '/recipes?page=20'
      expect(response.body).to include('No recipes to display')
    end
  end

  describe '#show' do
    let(:invalid_id) { 'uykdui' }
    let(:recipe) { Recipe.first }

    it 'renders the show view' do
      get "/recipes/#{recipe.id}"
      expect(response).to render_template(:show)
    end

    it 'redirects to 404 if not_found' do
      get "/recipes/#{invalid_id}"
      expect(response).to have_http_status(:not_found)
    end
  end
end
