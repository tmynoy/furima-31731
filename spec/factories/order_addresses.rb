FactoryBot.define do
  factory :order_address do
    postal         {"123-4567"}
    area_id        { 2 }
    municipalities {"調布市"}
    block          {"佐須町"}
    building_name  {"ビル"}
    tell_num       {"01033333333"}
    token        {"tok_abcdefghijk00000000000000000"}
  end
end
