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

  def test_account_login_not_exist
    self.class.post "/api/accounts",:body => {:account => {"name" => "player_abc", "password" => "admin"}}.to_json
    resp = self.class.put "/api/accounts/login",:body => {"name" => "player_abcd", "password" => "admin"}.to_json
    puts resp.body
  end

  def test_account_login_not_password_fail
    self.class.post "/api/accounts",:body => {:account => {"name" => "player_abcd", "password" => "admin"}}.to_json
    resp = self.class.put "/api/accounts/login",:body => {"name" => "player_abcd", "password" => "admin01"}.to_json
    puts resp.body
  end

  def test_account_login_success
    self.class.post "/api/accounts",:body => {:account => {"name" => "player_abcde", "password" => "admin"}}.to_json
    resp = self.class.put "/api/accounts/login",:body => {"name" => "player_abcde", "password" => "admin"}.to_json
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
