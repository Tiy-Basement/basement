json.event do
  json.title @event.title
  json.start @event.start
  json.end @event.end
  json.location @event.location
  json.note @event.note
  json.user_id @event.user_id
  json.group_id @event.group_id
  json.updated_at @event.updated_at
 

end