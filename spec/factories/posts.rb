# spec/factories/posts.rb
require 'faker'

FactoryGirl.define do
  factory :post do |f|
    f.text { Faker::Name.first_name }
    f.title { Faker::Name.first_name }
    f.url { Faker::Internet.url }
    f.channel {FactoryGirl.create(:channel)}
    
  end

  

  factory :invalid_post, parent: :post do |f|
  f.channel {FactoryGirl.build(:channel)}
end
end