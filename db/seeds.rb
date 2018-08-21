puts "Creating 2 unique users"
2.times do
  User.create({
    email: Faker::Internet.email,
    password: '123456',
    username: Faker::GameOfThrones.dragon
  })
end

puts "Created 2 unique users"

#_______________________________________________________________________________
puts "Creating 4 real businesses"

Business.create({
  name: "Starbucks",
  address: " R. Voluntários da Pátria, 89 - Botafogo, Rio de Janeiro - RJ",
  photo: "https://picsum.photos/200/300/?random"
})
Business.create({
  name: "WeWork",
  address: "495 Visconde de Piraja Avenue, Rio de Janeiro - RJ",
  photo: "https://picsum.photos/200/300/?random"
})
Business.create({
  name: "Armazém do café",
  address: "R. Visc. de Pirajá, 261, Rio de Janeiro",
  photo: "https://picsum.photos/200/300/?random"
})
Business.create({
  name: "Kilograma",
  address: "R. Visc. de Pirajá, 644,  Ipanema, Rio de Janeiro - RJ",
  photo: "https://picsum.photos/200/300/?random"
})


puts "Created 4 real businesses"

#_______________________________________________________________________________
puts "Creating 10 unique reviews"
10.times do
  Review.create({
    description: Faker::GameOfThrones.quote,
    english_rating: [1, 2, 3, 4, 5].sample,
    rating: [1, 2, 3, 4, 5].sample,
    user_id: User.ids.sample,
    business_id: Business.ids.sample
  })
end

puts "Created 10 unique reviews"
