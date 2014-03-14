json.array!(@matches) do |match|
  json.extract! match, :id, :grade, :date, :opopponent, :winner, :score, :description
  json.url match_url(match, format: :json)
end
