FactoryGirl.define do
  factory :user do
    email    { FFaker::Internet.email }
    name     { FFaker::Name.name }
    password { 'changeme' }
    password_confirmation { 'changeme' }
  end
end