FactoryBot.define do
  factory :tweet do
    text { Faker::Quote.famous_last_words }
    user { nil }
  end
end
