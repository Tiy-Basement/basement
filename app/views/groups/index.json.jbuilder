json.groups @groups do |group|
  json.name group.name
  json.owner group.user.username
  json.category group.category
  json.public group.public
  json.id group.id
  json.message "chocolate chip"
end