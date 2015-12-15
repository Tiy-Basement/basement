json.group do
  json.name @group.name
  json.owner @group.owner_id
  json.category @group.category
  json.public @group.public
  json.id @group.id
end

json.members @members do |member|
  json.email member.email
  json.username member.username
  json.phone member.phone
  json.id member.id
end
