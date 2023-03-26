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
                               rv_hookup: false,
                               created_at: 1.day.ago)
all_good = Festival.create!(name: "All Good Music Festival",
                            city: "Masontown, WV",
                            kid_friendly: true,
                            ticket_price: 550,
                            dates: "July 15th - 17th, 2023",
                            rv_hookup: false,
                            created_at: 3.days.ago)     
sts9 = Artist.create!(name: "STS9",
                      explicit_content: false,
                      performance_day: "Friday, Saturday",
                      number_of_performances: 2,
                      festival_appearances: 10,
                      festival: summer_camp)
les = Artist.create!(name: "Les Claypool",
                     explicit_content: false,
                     performance_day: "Saturday",
                     number_of_performances: 1,
                     festival_appearances: 5,
                     festival: all_good)
bone_thugs = Artist.create!(name: "Bone Thugs in Harmony",
                            explicit_content: true,
                            performance_day: "Sunday",
                            number_of_performances: 1,
                            festival_appearances: 3,
                            festival: summer_camp)
bassnectar = Artist.create!(name: "Bassnectar",
                            explicit_content: false,
                            performance_day: "Friday",
                            number_of_performances: 1,
                            festival_appearances: 2,
                            festival: all_good)