# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Task.create(name: "Go market", description: "Buy somes supplies for my girlfriend")
Task.create(name: "Make workout", description: "Make 3 times abs and pushups")
Task.create(name: "Meeting with Pedro", description: "Talk about my upgrade in the office")

Person.create(name: "David")
Person.create(name: "Victor")
Person.create(name: "Juan")
