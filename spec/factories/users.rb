FactoryBot.define do
  factory :user do
    confirmed_at { Time.now }
    email { "test@example.com" }
    password { "please123" }
    person
    trait :admin do
      role { 'admin' }
    end

  end
end
