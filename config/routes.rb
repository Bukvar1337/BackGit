Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'projects#index', as: 'home'
  resources :users
  resources :projects
  resources :project_risks
  resources :project_stages
  resources :risks
  resources :risk_probability_levels
  namespace :risks do
  resources :strategies
  end
  resources :risk_statuses
  get '/get_departments', to: 'integrations#get_departments'
  get '/get_projects', to: 'integrations#get_projects'
  get '/get_users', to: 'integrations#get_users'
end
