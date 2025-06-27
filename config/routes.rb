Rails.application.routes.draw do
  root "terminal#index"
  post "execute", to: "terminal#execute"
end
