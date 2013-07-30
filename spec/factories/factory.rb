FactoryGirl.define do
  factory :patient do
  	username 'shane'
  	email
	  phone '01234567'
  	password 'password'
  end

  factory :carer do
    username 'carer'
    email
    phone '01234567'
    relationship 'Family'
    password 'password'
    association :patient, factory: :patient
  end

  factory :doctor do
	  username 'doctor'
	  email
	  phone '0987654234'
	  speciality 'Surgeon'
	  password 'password'
  end

  sequence :email do |n|
    "unique_email#{n}@example.com"
  end
end