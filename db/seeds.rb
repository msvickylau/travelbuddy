james = User.create(username: "James1", email: "ja20@gmail.com", password: "pass")
mike = User.create(username: "Mike1", email: "mk@gmail.com", password: "word")
ashley = User.create(username: "Ashley1", email: "Ash@gmail.com",password: "wordd")

Post.create(user_id: 1, title: "ASIA", content: "anyoneone intrested in traveling with me?", start_date: "2018-01-10", end_date: "2018-01-20")
Post.create(user_id: 1, title: "UK?", content: "would like to find a buddy to travel to UK?", start_date: "2018-02-10", end_date: "2018-02-15")
Post.create(user_id: 2, title: "Euro TRIP?", content: "3 weeks euro trip, anyone wanna join?", start_date: "2018-01-10", end_date: "2018-04-10")

Destination.create(country: "China")
Destination.create(country: "Thailand")
Destination.create(country: "Vietnam")
Destination.create(country: "United Kingdom")
Destination.create(country: "Germany")
Destination.create(country: "Schotland")
Destination.create(country: "France")
Destination.create(country: "Holland")

PostDestination.create(post_id: 1, destination_id:1)
PostDestination.create(post_id: 1, destination_id:2)
PostDestination.create(post_id: 1, destination_id:3)
PostDestination.create(post_id: 2, destination_id:4)
PostDestination.create(post_id: 3, destination_id:4)
PostDestination.create(post_id: 3, destination_id:5)
PostDestination.create(post_id: 3, destination_id:6)
PostDestination.create(post_id: 3, destination_id:7)
PostDestination.create(post_id: 3, destination_id:8)

Comment.create(user_id: 2, post_id: 1, content: "Hi James, yes lets go")
Comment.create(user_id: 1, post_id: 1, content: "Hi Mike, when r u ther?")
Comment.create(user_id: 1, post_id: 2, content: "Anyone wanna joing me in UK?")
Comment.create(user_id: 3, post_id: 1, content: "Hi I want to go to Asia too!") 


            