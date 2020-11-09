FactoryBot.define do
  factory :user do
    nickname                { 'tarou' }
    email                   { 'test@mail.com' }
    password                { '123abc' }
    password_confirmation   { password }
    last_name               { '山田' }
    first_name              { '太郎' }
    last_name_check         { 'ヤマダ' }
    first_name_check        { 'タロウ' }
    birthday                { '1996-01-01' }
  end
end
