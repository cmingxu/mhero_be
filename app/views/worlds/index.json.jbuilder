json.array!(@worlds) do |world|
  json.extract! world, :id, :name, :account_count
  json.url world_url(world, format: :json)
end
