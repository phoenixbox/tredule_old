FactoryGirl.define do
  factory :patient do
  	username 'shane'
  	email 'example@example.com'
	  phone '01234567'
  	password 'password'
  end

  factory :doctor do
	  username 'doctor'
	  email 'doctor@example.com'
	  phone '0987654234'
	  speciality 'Surgeon'
	  password 'password'
  end
end