FactoryGirl.define do
  sequence(:random_string) {|n| Forgery(:lorem_ipsum).words(10) }

  factory :post do
    title { generate(:random_string) }
    body { generate(:random_string) }
  end
end
