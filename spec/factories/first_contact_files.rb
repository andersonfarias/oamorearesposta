FactoryBot.define do
  factory :first_contact_file do
    date { "2016-06-16" }
    hour { 1 }
    institution { "MyString" }
    operational_context_first_contact { 1 }
    how_established_first_contact { 1 }
    contact_source_type { 1 }
    how_person_knew_about_the_organization { 1 }
    beneficiary_and_contact_source_relationship { 1 }
    is_new_partner { false }
    number_of_previous_treatments { 1 }
    place_of_previous_treatments { 1 }
    marital_status { 1 }
    number_sons { 1 }
    number_daughters { 1 }
    ethnic_group { 1 }
    religion { "MyString" }
    family_structure { 1 }
    scolarity { 1 }
    job { 1 }
    first_contact_conditions { "MyString" }
    petitions { "MyString" }
    answer { "MyString" }
    results { "MyString" }
    comments { "MyString" }
    beneficiary nil
    user nil
  end
end
