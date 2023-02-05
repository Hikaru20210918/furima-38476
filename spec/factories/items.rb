FactoryBot.define do
  factory :item do
    item_name         { '商品名テスト' }
    price             { '1000' }
    detail            { '詳細テスト' }
    image             { 'imageテスト' }
    postage_id        { '1' }
    category_id       { '1' }
    state_id          { '1' }
    area_id           { '1' }
    sipping_day_id    { '1' }
    association       :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
