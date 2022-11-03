# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "faker"

Review.delete_all
User.delete_all
Hero.delete_all

User.create(email: "usuario@prueba.com", password: "password")
User.create(email: "usuario2@prueba.com", password: "password")

10.times {
  Hero.create(
    alias: Faker::DcComics.hero,
    real_name: Faker::DcComics.name,
    universe: "DC",
    bio: Faker::Lorem.paragraph
  )
}

20.times {
  r = Review.create(
    text: Faker::Lorem.paragraph,
    score: Faker::Number.between(from: 1 , to: 10),
    user_id: Faker::Number.between(from: User.first.id, to: User.last.id),
    hero_id: Faker::Number.between(from: Hero.first.id, to: Hero.last.id)
  )
  Hero.find(r.hero_id).update_hero_score(r.score)
}
