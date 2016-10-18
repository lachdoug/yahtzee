User.create(id: 1, username: 'admin', password: 'password', password_confirmation: 'password')
User.new(id: 2, username: 'Callie A').save(validate: false)
User.new(id: 3, username: 'Alf S').save(validate: false)
User.new(id: 4, username: 'Lilly M').save(validate: false)

Game.create(id: 1, user_id: 3, dice: [1,2,3,4,5], created_at: "2016-07-26 00:48:25", updated_at: "2016-07-26 00:48:25")
Game.create(id: 2, user_id: 2, dice: [6,6,6,6,6], created_at: "2016-07-26 00:50:10", updated_at: "2016-07-26 00:50:10")
