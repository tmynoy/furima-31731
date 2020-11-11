FactoryBot.define do
  factory :item do
    name                { 'test' }
    explanation         { 'test' }
    category_id         { '2' }
    status_id           { '2' }
    payment_id          { '2' }
    area_id             { '2' }
    send_day_id         { '2' }
    price               {'1000'}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
