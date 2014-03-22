# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
Grade.delete_all
%(a b c d e f).each do { |g| Grade.create!(name: g.upcase, key: g) }
Grade.create!(name: 'Ladies Div 1', key: 'ld1')
Grade.create!(name: 'Ladies Div 2', key: 'ld2')
Grade.create!(name: 'Veterans Div 1', key: 'v1')
Grade.create!(name: 'Veterans Div 2', key: 'v2')
