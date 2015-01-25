# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
    users = User.create([{ fname: 'FARRIN', lname: 'ARRETTEIG', email: 'nflint+1@gmail.com', password: 'password', password_confirmation: 'password' },
                                                            { fname: 'NA LIA', lname: 'CALHOUN POPE', email: 'nflint+2@gmail.com', password: 'password', password_confirmation: 'password' },
                                                            { fname: 'SAVANNAH', lname: 'CRANDALL', email: 'nflint+3@gmail.com', password: 'password', password_confirmation: 'password' },
                                                            { fname: 'GABRIELLE', lname: 'FINLEY', email: 'nflint+4@gmail.com', password: 'password', password_confirmation: 'password' },
                                                            { fname: 'GENNESIS', lname: 'GARATACHIA INIESTA', email: 'nflint+5@gmail.com', password: 'password', password_confirmation: 'password' },
                                                            { fname: 'KIAN', lname: 'GARCIA', email: 'nflint+6@gmail.com', password: 'password', password_confirmation: 'password' },
                                                            { fname: 'MELANNIE', lname: 'GOMEZ MORENO', email: 'nflint+7@gmail.com', password: 'password', password_confirmation: 'password' },
                                                            { fname: 'JOHN', lname: 'HUTCHINSON', email: 'nflint+8@gmail.com', password: 'password', password_confirmation: 'password' },
                                                            { fname: 'ALIVIA', lname: 'JARAMILLO', email: 'nflint+9@gmail.com', password: 'password', password_confirmation: 'password' },
                                                            { fname: 'AJAI', lname: 'JOHNSON', email: 'nflint+10@gmail.com', password: 'password', password_confirmation: 'password' },
                                                            { fname: 'MARY', lname: 'JOHNSON', email: 'nflint+11@gmail.com', password: 'password', password_confirmation: 'password' },
                                                            { fname: 'MACAYLA', lname: 'JOHNSTON', email: 'nflint+12@gmail.com', password: 'password', password_confirmation: 'password' },
                                                            { fname: 'HUDSON', lname: 'LEEBERT', email: 'nflint+13@gmail.com', password: 'password', password_confirmation: 'password' },
                                                            { fname: 'QUENTIN', lname: 'MCKEE', email: 'nflint+14@gmail.com', password: 'password', password_confirmation: 'password' },
                                                            { fname: 'KALLIE', lname: 'MEDRANO', email: 'nflint+15@gmail.com', password: 'password', password_confirmation: 'password' },
                                                            { fname: 'TRU', lname: 'MOODY', email: 'nflint+16@gmail.com', password: 'password', password_confirmation: 'password' },
                                                            { fname: 'OCTAVIO', lname: 'NUNEZ', email: 'nflint+17@gmail.com', password: 'password', password_confirmation: 'password' },
                                                            { fname: 'JAYVIAN', lname: 'PORTILLOS', email: 'nflint+18@gmail.com', password: 'password', password_confirmation: 'password' },
                                                            { fname: 'AIDEN', lname: 'RAMIREZ', email: 'nflint+19@gmail.com', password: 'password', password_confirmation: 'password' },
                                                            { fname: 'DAKOTA', lname: 'WHITT', email: 'nflint+20@gmail.com', password: 'password', password_confirmation: 'password' }])


    users.each do |user|
    	user.accounts.create()
    end


#   Mayor.create(name: 'Emanuel', city: cities.first)
