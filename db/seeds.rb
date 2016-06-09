# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Country.create!([
  { name: "Chile"},
  { name: "Argentina"},
  { name: "Perú"}
  ])


City.create!([
  { name: "Santiago", country_id: 1},
  { name: "Valparaiso", country_id: 1},
  ])

City.create!([
  { name: "Mendoza", country_id: 2},
  { name: "Buenos Aires", country_id: 2},
  ])

City.create!([
  { name: "Lima", country_id: 3},
  { name: "Ica", country_id: 3},
  ])