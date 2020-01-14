
User.create(email: "janaeelisa@gmail.com", password: "password", password_confirmation: "password", name: "Janae")
User.create(email: "srgallagher1@gmail.com", password: "password", password_confirmation: "password", name: "Sean")
User.create(email: "lawrieleehall@gmail.com", password: "password", password_confirmation: "password", name: "Elisabeth")


Child.create(name: "Hazel", birthdate: "2018-09-14", parents: [User.find(1)])

Milestone.create(date: "2019-06-05", content: "learned to walk", child_id: 1)
Milestone.create(date: "2019-12-14", content: "first words", child_id: 1)

Post.create(content: "new post", child_id: 1, user_id: 1)