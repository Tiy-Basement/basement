Rails.application.routes.draw do
#groups
post "/group", to: "groups#create"
delete "/group", to: "groups#delete"

  #REGISTRATION CONTROLLER
post "/signup", to: "registrations#create"  #creates a new user
delete "/signup", to: "registrations#destroy" #deletes a user
post "/login", to: "registrations#login"  #login user
get "/logout", to: "registrations#logout" #logout user

  #USERS CONTROLLER
#Get User Profile/Calendar
#Update User Profile (name, email, etc)
#Add Calendar Event
#Edit Calendar Event
#Delete Calendar Event
#Push events to group calendar


