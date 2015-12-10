Rails.application.routes.draw do

  #GROUPS
post "/group", to: "groups#create"
post "/group/:id", to: "groups#edit"
delete "/group", to: "groups#delete"
#post "/group/:id/member", to: "groups#addmember"
#delete "/group/:id/member", to: "groups#deletemember"

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
get "/group/events", to: "events#group_event_index"  #as: usereventindex
post "/events", to: "events#create"
put "/events/:id", to: "events#edit"
delete "/events/:id", to: "events#delete"
get "/user/:id/events/calendar", to: "events#calendar_user_index"
  
  #MEMBERSHIP CONTROLLER
post "/group/:id/members", to: "memberships#add"
delete "/group/:id/member/:id", to: "memberships#delete"

  #NOTES CONTROLLER
get "/notes", to: "notes#index"
post "/notes", to: "notes#create"
get "/notes/:id", to: "notes#show"
delete "/notes/:id", to: "notes#delete"

end

