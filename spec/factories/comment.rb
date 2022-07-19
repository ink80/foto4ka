FactoryBot.define do
  factory :comment do
    association :post

    body { FFaker::Lorem.paragraph }
    username { FFaker::Name.name }
  end
end
