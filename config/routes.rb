Rails.application.routes.draw do
  devise_for :accounts, controllers: { omniauth_callbacks: 'accounts/omniauth_callbacks' }
  get '/ofertas-empleo', to: 'jobs#index', as: 'jobs'
  get '/publicar-vacante', to: 'jobs#new', as: 'jobs_new'
  post '/ofertas-empleo', to: 'jobs#create', as: 'jobs_create'
  get '/ofertas-empleo/:id', to: 'jobs#show', as: 'job_details'
  get '/ofertas-empleo/:id/editar', to: 'jobs#edit', as: 'job_edit'
  patch '/ofertas-empleo/:id', to: 'jobs#update', as: 'job_update'
  delete '/ofertas-empleo/:id', to: 'jobs#destroy', as: 'job_delete'

  get '/empresas', to: 'accounts#index', as: 'companies'
  get '/empresas/:id', to: 'accounts#job_list', as: 'company_jobs'

  resources :accounts

  root 'home#index'
end
