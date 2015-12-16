json.members @members do |member|
	json.user member.user_id
	json.group member.group_id
end