json.user do
  json.email @user.email
  json.username @user.username
  json.phone @user.phone
  json.access_token @user.access_token

end