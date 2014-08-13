Rails.application.routes.draw do

  get 'learn/index'
  get 'learn/next'
  post 'learn/start'


  resources :words

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'words#index'

end
