FactoryBot.define do
  factory :partner do
    person_id { 1 }
    fantasy_name { "MyString" }
    contact_person_1 { 1 }
    contact_person_2 { 1 }
    cnpj { "MyString" }
    type { 1 }
    is_active { false }
    work_area { 1 }
  end
end
