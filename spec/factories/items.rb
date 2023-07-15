FactoryBot.define do
  factory :item do
    item_name               {Faker::Internet.name}
    price                   {10000}
    delivery_charge_id      {2}
    explanation             {Faker::Lorem.sentence}
    category_id             {2} 
    quality_id              {3}
    shipping_origin_area_id {4}
    delivery_date_id        {3}
    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
