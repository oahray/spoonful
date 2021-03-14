# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'recipes#index'

  resources :recipes, only: %i[index show]

  # custom error endpoints
  match '*unmatched', to: 'application#route_not_found', via: :all
end
