Rails.application.routes.draw do
  root to: "invitations#new"

  resources :invitations, only: [:new] do
  	collection do
  		post :send_invitation
  		get :recordings
  	end
  end

end
