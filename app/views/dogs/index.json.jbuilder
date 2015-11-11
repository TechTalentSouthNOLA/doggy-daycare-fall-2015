json.array!(@dogs) do |dog|
  json.extract! dog, :id, :name, :breed_id, :dob, :owner_id, :medical_conditions
  json.url dog_url(dog, format: :json)
end
