FactoryBot.define do
  factory :order_address do
    postcode        {"000-0000"}
    municipalities  {"横浜"}
    address         {"1-1"}
    phone_number    {"08000000000"}
    area_id         {"1"}
    token           {"tok_abcdefghijk00000000000000000"}
  end
end