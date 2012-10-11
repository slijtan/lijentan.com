FactoryGirl.define do
  factory :image do
    url { "http://#{Forgery(:internet).domain_name}/test-image.jpg" }
    sequence(:position) {|n| n }
    post
  end
end
