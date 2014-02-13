# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


account = Account.new name: "xcm", email: "cming.xu@gmail.com"
account.password = "admin"
account.save


account = Account.new name: "whygod", email: "whygod@gmail.com"
account.password = "admin"
account.save
