json.user do
	json.id @user.id
	json.email @user.email
	json.username @user.username
	json.phone @user.phone
end

json.groups @groups do |group|
  json.name group.name
  json.owner group.owner_id
  json.category group.category
  json.public group.public
  json.id group.id
  json.message "Insert cute kitten here"
end