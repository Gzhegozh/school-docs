json.array!(@grades) do |grade|
  json.extract! grade, :id, :name, :description, :certificate_template_path, :school_id
  json.url grade_url(grade, format: :json)
end
