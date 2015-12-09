Rails.application.routes.draw do

  #GROUPS
post "/group", to: "groups#create"
post "/group/:id", to: "groups#edit"
delete "/group", to: "groups#delete"
post "/group/:id/member", to: "groups#addmember"
delete "/group/:id/member", to: "groups#deletemember"

  #COOKIE CONTROLLER
get "/cookie", to: "cookie#get"
post "/cookie", to: "cookie#create"
  
  #REGISTRATION CONTROLLER
post "/signup", to: "registrations#create"  #creates a new user
delete "/user/:id", to: "registrations#destroy" #deletes a user
post "/login", to: "registrations#login"  #login user
get "/logout", to: "registrations#logout" #logout user

  #USER
get "/users", to: "users#index"
get "/users/:id/groups", to: "users#groups"

  #EVENTS
get "/user/events", to: "events#user_event_index"
get "/group/events", to: "events#group_event_index"  #as: usereventindex
post "/events", to: "events#create"
  #MEMBERSHIP
post "/group/:id/member/:id", to: "memberships#add"
delete "/group/:id/member/:id", to: "memberships#delete"

end

