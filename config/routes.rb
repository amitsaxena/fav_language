Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: 'pages#index'
  post 'result', to: 'pages#result'
  get 'result', to: redirect('/')
  get '8f90b5a2-186d-47d7-b72b-b7ed0eee7ce6', to: 'pages#sample'
  
end
