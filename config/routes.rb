Rails.application.routes.draw do
 # Create
  get "tasks/new", to: "tasks#new", as: :task_new
  post "tasks", to: "tasks#create"

  # Read
  get "tasks", to: "tasks#index"
  get "tasks/:id", to: "tasks#show", as: :task

  # Update
  get "tasks/:id/edit", to:"tasks#edit", as: :task_edit
  patch "tasks/:id", to:"tasks#update"

  delete "tasks/:id", to: "tasks#destroy"
end
