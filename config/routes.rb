Rails.application.routes.draw do

  #GROUPS
get "/groups", to: "groups#index"
post "/group", to: "groups#create"
put "/group/:id", to: "groups#edit"
delete "/group/:id", to: "groups#delete"
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
get "events/id", to: "events#find_id"
  
  #MEMBERSHIP CONTROLLER
#get "/members", to: "memberships#memberindex"
post "/group/:id/members", to: "memberships#add"
delete "/group/:id/member/:id", to: "memberships#delete"

  #NOTES CONTROLLER
get "/notes", to: "notes#index"
post "/notes", to: "notes#create"
get "/notes/:id", to: "notes#show"
delete "/notes/:id", to: "notes#delete"

end

