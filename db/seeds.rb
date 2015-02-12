# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
   # users = User.create([{ fname: 'DJEMILA', lname: 'AZMERA', email: 'nflint+1@gmail.com', password: 'password', password_confirmation: 'password' },
    #					{ fname: 'JHOANNA', lname: 'BONIFAS', email: 'nflint+2@gmail.com', password: 'password', password_confirmation: 'password' },
    #					{ fname: 'ABIGAIL', lname: 'BULJUNG', email: 'nflint+3@gmail.com', password: 'password', password_confirmation: 'password' },
    #					{ fname: 'ROMAN', lname: 'BURNSIDE', email: 'nflint+4@gmail.com', password: 'password', password_confirmation: 'password' },
    #					{ fname: 'DYMON', lname: 'ELLIOTT', email: 'nflint+5@gmail.com', password: 'password', password_confirmation: 'password' },
    #					{ fname: 'AYDEN', lname: 'GONZALEZ JOHNSON', email: 'nflint+6@gmail.com', password: 'password', password_confirmation: 'password' },
    #					{ fname: 'MARK', lname: 'GOODWIN', email: 'nflint+7@gmail.com', password: 'password', password_confirmation: 'password' },
    #					{ fname: 'SRIYEASH', lname: 'GUPTA', email: 'nflint+8@gmail.com', password: 'password', password_confirmation: 'password' },
    #					{ fname: 'ASHLIE', lname: 'HONG', email: 'nflint+9@gmail.com', password: 'password', password_confirmation: 'password' },
    #					{ fname: 'ABIGAIL', lname: 'HUNT', email: 'nflint+10@gmail.com', password: 'password', password_confirmation: 'password' },
    #					{ fname: 'KAIDEN', lname: 'HUNTER', email: 'nflint+11@gmail.com', password: 'password', password_confirmation: 'password' },
    #					{ fname: 'KENNETH', lname: 'JONES', email: 'nflint+12@gmail.com', password: 'password', password_confirmation: 'password' },
    #					{ fname: 'DAKOTA', lname: 'LEE', email: 'nflint+13@gmail.com', password: 'password', password_confirmation: 'password' },
    #					{ fname: 'VICTOR', lname: 'LOPEZ', email: 'nflint+14@gmail.com', password: 'password', password_confirmation: 'password' },
    #					{ fname: 'EMILY', lname: 'LOWE', email: 'nflint+15@gmail.com', password: 'password', password_confirmation: 'password' },
    #					{ fname: 'JOHN', lname: 'MOYER', email: 'nflint+16@gmail.com', password: 'password', password_confirmation: 'password' },
    #					{ fname: 'BLAKE', lname: 'MUSIL', email: 'nflint+17@gmail.com', password: 'password', password_confirmation: 'password' },
    #					{ fname: 'WILLIAM', lname: 'PLATO', email: 'nflint+18@gmail.com', password: 'password', password_confirmation: 'password' },
    #					{ fname: 'CADENCE', lname: 'PURDY', email: 'nflint+19@gmail.com', password: 'password', password_confirmation: 'password' },
    #					{ fname: 'JAKOB', lname: 'SANDOW FRAZIER', email: 'nflint+20@gmail.com', password: 'password', password_confirmation: 'password' },
    #					{ fname: 'DIEGO', lname: 'SAUCEDA', email: 'nflint+21@gmail.com', password: 'password', password_confirmation: 'password' },
    #					{ fname: 'DAVID', lname: 'SHAFFER', email: 'nflint+22@gmail.com', password: 'password', password_confirmation: 'password' },
    #					{ fname: 'ELIOT', lname: 'TOLLIS', email: 'nflint+23@gmail.com', password: 'password', password_confirmation: 'password' }])


    users.each do |user|
    	user.accounts.create()
    end


#   Mayor.create(name: 'Emanuel', city: cities.first)
