# spec/factories/comments.rb
require 'faker'

FactoryGirl.define do
  factory :comment do |f|
    f.text { Faker::Name.first_name }
  end
end