FactoryBot.define do
  factory :buyers_order do
    token {"tok_abcdefghijk00000000000000000"}
    post_number { '123-4567' }
    region_id { 14 }
    municipality { '港区' }
    house_number { '青山1-1-1' }
    building_name { '東京ハイツ' }
    phone_number {'09012345678'}
    association :user
    association :item
  end
end
