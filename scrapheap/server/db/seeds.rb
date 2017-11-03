User.create(id: 1, username: 'admin', password: 'password', password_confirmation: 'password')
User.new(id: 2, username: 'Callie A').save(validate: false)
User.new(id: 3, username: 'Alf S').save(validate: false)
User.new(id: 4, username: 'Lilly M').save(validate: false)

Room.create(id: 1, user_id: 3, name: "First room", created_at: "2017-10-08 00:48:25", updated_at: "2017-10-08 00:48:25")
Room.create(id: 2, user_id: 2, name: "Working yet?", created_at: "2017-10-08 00:50:10", updated_at: "2017-10-08 00:50:10")

Message.create(id: 1, room_id: 1, user_id: 3, body: "Test 1", created_at: "2017-10-08 00:48:33", updated_at: "2017-10-08 00:48:33")
Message.create(id: 2, room_id: 1, user_id: 3, body: "Test 2", created_at: "2017-10-08 00:48:41", updated_at: "2017-10-08 00:48:41")
Message.create(id: 3, room_id: 2, user_id: 2, body: "Is this data from the server?", created_at: "2017-10-08 00:50:20", updated_at: "2017-10-08 00:50:20")
Message.create(id: 4, room_id: 2, user_id: 4, body: "Yes!", created_at: "2017-10-08 00:50:38", updated_at: "2017-10-08 00:50:38")
Message.create(id: 5, room_id: 2, user_id: 2, body: "Cool.", created_at: "2017-10-08 00:50:50", updated_at: "2017-10-08 00:50:50")
