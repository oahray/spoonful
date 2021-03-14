# frozen_string_literal: true

RSpec.describe 'Application', type: :request do
  describe '#route_not_found' do
    it 'redirects to 404 if not_found' do
      get '/404'
      expect(response.body).to include(
        "The page you were looking for doesn't exist (404)"
      )
    end
  end
end
