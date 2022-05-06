# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

divisions_from_file = File.read("db/address_json/divisions.json")

JSON.parse(divisions_from_file).each do |d|
  Division.create!(id: d['id'],name: d['name'], bn_name: d['bn_name'], url: d['url'])
end

districts_from_file = File.read("db/address_json/districts.json")
JSON.parse(districts_from_file).each do |d|
  District.create!(id: d['id'], division_id: d['division_id'], name: d['name'], bn_name: d['bn_name'], url: d['url'])
end

upojillas_from_file = File.read("db/address_json/upojillas.json")
JSON.parse(upojillas_from_file).each do |d|
  Upojilla.create!(id: d['id'], district_id: d['district_id'], name: d['name'], bn_name: d['bn_name'], url: d['url'])
end

unions_from_file = File.read("db/address_json/unions.json")
JSON.parse(unions_from_file).each do |d|
  Union.create!(id: d['id'], upojilla_id: d['upojilla_id'], name: d['name'], bn_name: d['bn_name'], url: d['url'])
end
