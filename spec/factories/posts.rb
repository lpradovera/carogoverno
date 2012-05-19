# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    user_id 1
    posted_at "2012-05-05 16:38:29"
    body "MyText"
  end
end
