# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Tank.delete_all
Job.delete_all

user = User.create( :username => 'x', :password => 'x', :password_confirmation => 'x', :first => 'bryan', :last => 'reid' )
user.tanks << Tank.create( :name => 'Default' )
