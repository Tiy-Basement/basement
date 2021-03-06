Rails.application.routes.draw do

  #GROUPS
get "/groups", to: "groups#index"
get "/group/:id/info", to: "groups#info"
post "/group", to: "groups#create"
put "/group/:id", to: "groups#edit"
delete "/group/:id", to: "groups#delete"


  #COOKIE CONTROLLER
get "/cookie", to: "cookie#get"
post "/cookie", to: "cookie#create"
  
  #REGISTRATION CONTROLLER
post "/signup", to: "registrations#create"  #creates a new user
delete "/user/:id", to: "registrations#destroy" #deletes a user
post "/login", to: "registrations#login"  #login user
get "/logout", to: "registrations#logout" #logout user

  #USER CONTROLLER
get "/users", to: "users#index"
get "/users/groups", to: "users#groups"
get "/users/info", to: "users#user_info"


  #EVENTS CONTROLLER
get "/user/:id/events", to: "events#user_event_index"
get "/group/:id/events", to: "events#groupevents"
get "/events", to: "events#event_index"  #for admin use only
get "/group/:id/members/events", to: "events#member_events_index"
post "/events", to: "events#create" #creates a user event
post "/group/:id/events", to: "events#groupcreate" #creates an event under a group
put "/events/:id", to: "events#edit"
delete "/events/:id", to: "events#delete"
get "/user/:id/groups/events", to: "events#usergroup_events_index"
get "/events/:id", to: "events#find_id"


  #MEMBERSHIP CONTROLLER
get "/group/:id/members", to: "memberships#memberindex"
post "/group/member", to: "memberships#add"
delete "/group/:id/member/:user_id", to: "memberships#remove"

  #NOTES CONTROLLER
get "/notes", to: "notes#index"
post "/notes", to: "notes#create"
get "/notes/:id", to: "notes#show"
delete "/notes/:id", to: "notes#delete"

end

