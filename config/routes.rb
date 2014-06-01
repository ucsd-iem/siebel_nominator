SiebelScholars::Application.routes.draw do
  devise_for :users
  devise_scope :user do
    match "login" => "devise/sessions#new", :as => :new_user_session
  end

  get "welcome/pseudo_logout", :as => :pseudo_logout
  get "thanks" => 'welcome#thanks', :as => :thanks

  resources :nominations do
    match 'download_letter', :action => :download_letter, :conditions => { :method => :get }, :as => :download_letter
    match 'download_resume', :action => :download_resume, :conditions => { :method => :get }, :as => :download_resume
    match 'download_transcript', :action => :download_transcript, :conditions => { :method => :get }, :as => :download_transcript
    match 'download_statement', :action => :download_statement, :conditions => { :method => :get }, :as => :download_statement
    match 'download_misc', :action => :download_misc, :conditions => { :method => :get }, :as => :download_misc
  end

  root :to => "welcome#index"

  match "nomination-instructions" => 'welcome#nomination_instructions', :as => :instructions
end
