# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
summer_camp = Festival.create!(name: "Summer Camp Music Festival",
                               city: "Chillicothe, IL",
                               kid_friendly: true,
                               ticket_price: 600,
                               dates: "May 26th - 28th, 2023",
                               rv_hookup: false)