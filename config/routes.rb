Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations', omniauth_callbacks: "omniauth_callbacks" }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get :rewards, to: "main#rewards"
  post :redeem_reward, to: "main#redeem_reward"
  root to: "main#index"
end
