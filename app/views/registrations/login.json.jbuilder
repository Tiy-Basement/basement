json.user do
  json.extract! @user, :id, :email, :access_token
end