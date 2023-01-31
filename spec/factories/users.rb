FactoryBot.define do
  factory :user do
    email                 {Faker::Internet.free_email}
    password              {'000000a'}
    password_confirmation {password}
    nickname              {'テスト'}
    first_name            {'堀田'}
    last_name             {'真那美'}
    first_name_kana       {'ホリタ'}
    last_name_kana        {'マナミ'}
    birthday              {'1994/01/01'}
  end
end
