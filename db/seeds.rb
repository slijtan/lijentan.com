# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Post.delete_all
Post.create(title: 'Hello World',
	    body: 'This is a test post generated by db/seeds.rb',
	    background_url: 'http://stuffpoint.com/gamesrocks/image/13260-gamesrocks-superman.jpg',
	    published: true,
	    date_published: DateTime.new(2012, 9, 28, 14, 43))

Post.create(title: 'Hello World 2',
	    body: 'This is a test post generated by db/seeds.rb',
	    background_url: 'http://3.bp.blogspot.com/-xcYzbROP7gE/T8yFqiykjAI/AAAAAAAAAfM/mDZ23lq-Rhk/s1600/The_Batman_II_by_ErikVonLehmann.jpg',
	    published: true,
	    date_published: DateTime.new(2012, 9, 29, 14, 43))

Post.create(title: 'Almost Hello World 3',
	    body: 'This is a test post generated by db/seeds.rb',
	    published: false)
