json.array!(@field_diaries) do |field_diary|
  json.extract! field_diary, :id, :data, :descricao
  json.url field_diary_url(field_diary, format: :json)
end
