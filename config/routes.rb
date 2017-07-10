Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :tests, only: [:index, :show] do
      resources :questions, only: [:index, :show], controller: 'tests/questions' do
        post :submit_answer
      end
    end
  end
end
