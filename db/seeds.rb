# -*- encoding : utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


moderator = Moderator.new email: "cming.xu@gmail.com"
moderator.password = "admin"
moderator.save


moderator = Moderator.new email: "whygod@gmail.com"
moderator.password = "admin"
moderator.save


uniq_user = UniqUser.new email: "cming.xu@gmail.com"
uniq_user.password = "admin"
uniq_user.save
uniq_user = UniqUser.new email: "whygod@gmail.com"
uniq_user.password = "admin"
uniq_user.save
