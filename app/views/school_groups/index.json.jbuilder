json.array!(@school_groups) do |school_group|
  json.extract! school_group, :id, :name
  json.url school_group_url(school_group, format: :json)
end
