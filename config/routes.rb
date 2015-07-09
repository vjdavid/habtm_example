Rails.application.routes.draw do

  resources :tasks, except: [:edit, :new] do
    member do
      get 'people_ids', to: 'tasks#get_people_ids'
      post 'people_ids', to: 'tasks#post_people_ids'
    end
  end

  resources :people, except: [:edit, :new] do
    member do
      get 'tasks_ids', to: 'people#get_tasks_ids'
      # { people_ids: [1,2,3] }
      post 'tasks_ids', to: 'people#post_tasks_ids'
      # { people_ids: [1,2,3] }
    end
  end

end
