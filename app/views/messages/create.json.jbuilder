json.id @message.id
json.content @message.content
json.date @message.created_at.strftime("%Y/%m/%d(%a) %H:%M")
json.user_name @message.user.name
json.user_id @message.user.id