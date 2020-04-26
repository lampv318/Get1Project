Rails.application.routes.draw do
  root to: "page#show"
  get "/*page" => "page#show"
end
