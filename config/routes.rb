Rails.application.routes.draw do

  resources :tasks, except: [:edit, :new] do
    member do
      get 'people', to: 'tasks#get_belongs_task'
      put 'people/:person_id', to: 'tasks#assign_person_to_task'
    end
  end

  resources :people, except: [:edit, :new] do
    member do
      get 'tasks', to: 'people#get_belongs_person'
      put 'tasks/:task_id', to: 'people#assign_person_to_task'
    end
  end

end
