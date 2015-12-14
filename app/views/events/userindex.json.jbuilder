json.array! @events do |event|
  json.id event.id
  json.title event.title
  json.start event.start
  json.end event.end
  json.location event.location
  json.note event.note
  json.user_id event.user_id
  
end
