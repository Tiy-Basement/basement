Rails.application.routes.draw do
#groups
post "/group", to: "groups#create"
delete "/group", to: "groups#delete"
end
