require "httparty"
require "active_support/all"

class ApiTest
  include HTTParty
  base_uri "http://localhost:3000"
  format :json
  headers 'Content-Type' => "application/json", "Accept" => "application/json"

  def test_account_creation
    resp = self.class.post "/api/accounts",:body => {:account => {"name" => "player#{rand(10000)}", "password" => "player1"}}.to_json
    puts resp.body
  end
end

def log(what)
  puts what
end

test = ApiTest.new

test.methods.each do |api|
  next unless api.to_s =~ /test/
  log("[API]" + api.to_s)
  test.send(api)
end
