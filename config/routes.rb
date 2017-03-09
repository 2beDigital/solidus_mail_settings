Spree::Core::Engine.routes.draw do
  namespace :admin do
    resource :mail_method, only: [:edit, :update] do
      post :testmail, on: :collection
    end
  end
end
