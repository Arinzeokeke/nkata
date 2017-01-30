# spec/factories/channels.rb
require 'faker'

FactoryGirl.define do
  factory :channel do |f|
    f.name { Faker::Name.first_name }
  end
end