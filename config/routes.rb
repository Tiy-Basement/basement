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

  #USERS CONTROLLER
#Get User Profile/Calendar
#Update User Profile (name, email, etc)
#Add Calendar Event
#Edit Calendar Event
#Delete Calendar Event
#Push events to group calendar
end

