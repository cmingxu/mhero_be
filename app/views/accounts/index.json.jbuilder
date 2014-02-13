json.array!(@accounts) do |account|
  json.extract! account, :id, :email, :encrypted_password, :salt
  json.url account_url(account, format: :json)
end
