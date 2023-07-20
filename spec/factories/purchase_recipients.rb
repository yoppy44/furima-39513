FactoryBot.define do
  factory :purchase_recipient do
    user_id {3}
    item_id {3}
    post_cord {'123-4567'}
    shipping_origin_area_id {13}
    municipalities {'浦安市ねずみ町'}
    address {'シンデレラ城1-1-1'}
    building_name {'シンデレラ城'}
    telephone_number {19012345678}
  end
end
