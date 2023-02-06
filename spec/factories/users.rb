FactoryBot.define do
  factory :user do
    email                 { Faker::Internet.free_email }
    password              { '000000a' }
    password_confirmation { password }
    nickname              { 'テスト' }
    first_name            { '山田' }
    last_name             { '一郎' }
    first_name_kana       { 'ヤマダ' }
    last_name_kana        { 'イチロウ' }
    birthday              { '1994/01/01' }
  end
end
