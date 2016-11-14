# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Contact.delete_all
Group.delete_all

Group.create!(:name => 'Family')
Group.create!(:name => 'Friends')
Group.create!(:name => 'Bitmaker')

50.times do |i|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = Faker::Internet.email
  random_note = Faker::Hipster.sentence
  group = Group.order("RANDOM()").first
  contact = Contact.create!({first_name: first_name, last_name: last_name, email: email, note: random_note})
  group.contacts << contact
end

tilr = Group.create!(:name => 'tilr')

Contact.create!(:first_name => 'Steve', :last_name => 'Luu', :note => 'Product, Strategy & Marketing', :email => 'steveluu@steveluu.com', :group_ids => [ Group.last.id])
Contact.create!(:first_name => 'Luke', :last_name => 'Vigeant', :note => 'CTO at tilr', :email => 'lukevigeant@lukevigeant.com', :group_ids => [ Group.last.id])
Contact.create!(:first_name => 'Carisa', :last_name => 'Miklusak', :note => 'CEO & President at tilr', :email => 'carisamiklusak@carisamiklusak.com', :group_ids => [ Group.last.id])
Contact.create!(:first_name => 'Summer', :last_name => 'Crenshaw', :note => 'COO/CMO & Co-Founder at tilr', :email => 'summercrenshaw@summercrenshaw.com', :group_ids => [ Group.last.id])
