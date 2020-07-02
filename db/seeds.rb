# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

sally = User.create(name: "Sally", email: "sally@gmail.com", password: "password", reviewer: true, bio: "Here's a little bit about me.")
tom = User.create(name: "Tom", email: "tom@gmail.com", password: "password")
susan = User.create(name: "Susan", email: "susan@gmail.com", password: "password")
joe = User.create(name: "Joseph", email: "joe@gmail.com", password: "password", reviewer: true, bio: "I'm a super smart literature professor.")

tolkien = Author.create(name: "JRR Tolkien", bio: "John Ronald Reuel Tolkien (3 January 1892 – 2 September 1973) was an English writer, poet, philologist, and academic. He was the author of the high fantasy works The Hobbit and The Lord of the Rings.")
austen = Author.create(name: "Jane Austen", bio: "Jane Austen (16 December 1775 – 18 July 1817) was an English novelist known primarily for her six major novels, which interpret, critique and comment upon the British landed gentry at the end of the 18th century. Austen's plots often explore the dependence of women on marriage in the pursuit of favourable social standing and economic security.")
king = Author.create(name: "Stephen King", bio: "Stephen Edwin King (born September 21, 1947) is an American author of horror, supernatural fiction, suspense, crime, science-fiction, and fantasy novels. His books have sold more than 350 million copies,[2] and many have been adapted into films, television series, miniseries, and comic books.")

fiction = Genre.create(name: "Fiction")
nonfiction = Genre.create(name: "Nonfiction")
fantasy = Genre.create(name: "Fantasy")
classic = Genre.create(name: "Classic")
horror = Genre.create(name: "Horror")
scifi = Genre.create(name: "Science Fiction")
