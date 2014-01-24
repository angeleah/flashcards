json.array!(@cards) do |card|
  json.extract! card, :definition, :object_type, :example, :return_type, :category
  json.url card_url(card, format: :json)
end
