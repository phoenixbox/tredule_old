# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :doctor, :class => 'Doctors' do
	  username 'doctor'
	  email 'doctor@example.com'
	  phone '0987654234'
	  speciality 'Surgeon'
	  password 'password'
  end
end
