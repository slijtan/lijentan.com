FactoryGirl.define do
  factory :post do
    type 'one-column-text'
    title { Forgery(:lorem_ipsum).title }
    body { Forgery(:lorem_ipsum).paragraphs(2) }
  end
end
