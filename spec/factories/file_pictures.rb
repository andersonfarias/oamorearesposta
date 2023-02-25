FactoryBot.define do
  factory :file_picture do
    file_name { "MyString" }
    content_type { "MyString" }
    file_contents { "" }
    activity_diary nil
  end
end
