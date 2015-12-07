json.users @users do |user|
  json.email user.email
  json.username user.username
  json.phone user.phone
  json.id user.id
  
end