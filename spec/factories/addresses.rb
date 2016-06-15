FactoryGirl.define do
  factory :address do
    street "MyString"
    neighboor "MyString"
    number "MyString"
    cep "MyString"
    complement "MyText"
    city nil
    person nil
  end
end
