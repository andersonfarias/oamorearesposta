FactoryBot.define do
  factory :person do
    first_name { "Test" }
    last_name { "Person" }
    age { 22 }
    gender { 1 }
  end
end
