# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
puts "Seeding Database"
patient = Patient.create(username: 'shane', email:'rogerssh@tcd.ie', phone:"1234567", password: 'password')
doctor = Doctor.create(username: 'doctor', email: 'doctor@doctor.com', phone: '09876543', medical_school: 'harvard', practice: 'Delaware St, Denver, Co', speciality: 'Surgeon', password: 'password')
