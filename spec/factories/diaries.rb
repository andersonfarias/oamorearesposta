FactoryBot.define do
  factory :diary do
    description { "MyText" }
    date { "2016-07-12" }
    user nil
    beneficiary nil
    type { "" }
  end
end
