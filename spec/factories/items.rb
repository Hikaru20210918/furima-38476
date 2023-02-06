FactoryBot.define do
  factory :item do
    item_name         { '商品名テスト' }
    price             { '1000' }
    detail            { '詳細テスト' }
    postage_id        { '2' }
    category_id       { '2' }
    states_id         { '2' }
    area_id           { '2' }
    sipping_day_id    { '2' }
    association       :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
