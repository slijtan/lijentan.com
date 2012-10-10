FactoryGirl.define do
  factory :post do
    title { Forgery(:lorem_ipsum).words(10) }
    body { Forgery(:lorem_ipsum).words(10) }
    type { Post.valid_types.sample }
  end

  factory :image do
    url { "http://#{Forgery(:internet).domain_name}/test-image.jpg" }
    sequence(:position) {|n| n }
    post
  end
end
