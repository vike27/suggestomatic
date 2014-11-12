json.array!(@suggestions) do |suggestion|
  json.extract! suggestion, :id, :suggester_id, :description, :vote_count
  json.url suggestion_url(suggestion, format: :json)
end
