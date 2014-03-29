# -*- encoding : utf-8 -*-
require "httparty"
require "active_support/all"

class ApiTest
  include HTTParty
  base_uri "http://localhost:3000"
  format :json
  headers 'Content-Type' => "application/json", "Accept" => "application/json"

  def test_uniq_user_creation
    resp = self.class.post "/api/uniq_users",:body => {:uniq_user => {"name" => "player#{rand(10000)}", "password" => "player1"}}.to_json
    puts resp.body
  end

  def test_uniq_user_login_not_exist
    self.class.post "/api/uniq_users",:body => {:uniq_user => {"name" => "player_abc", "password" => "admin"}}.to_json
    resp = self.class.put "/api/uniq_users/login",:body => {"name" => "player_abcd", "password" => "admin"}.to_json
    puts resp.body
  end

  def test_uniq_user_login_not_password_fail
    self.class.post "/api/uniq_users",:body => {:uniq_user => {"name" => "player_abcd", "password" => "admin"}}.to_json
    resp = self.class.put "/api/uniq_users/login",:body => {"name" => "player_abcd", "password" => "admin01"}.to_json
    puts resp.body
  end

  def test_uniq_user_login_success
    self.class.post "/api/uniq_users",:body => {:uniq_user => {"name" => "player_abcde", "password" => "admin"}}.to_json
    resp = self.class.put "/api/uniq_users/login",:body => {"name" => "player_abcde", "password" => "admin"}.to_json
    puts resp.body
  end

  def test_home_index
    self.class.post "/api/uniq_users",:body => {:uniq_user => {"name" => "player_abcde", "password" => "admin"}}.to_json
    resp = self.class.put "/api/uniq_users/login",:body => {"name" => "player_abcde", "password" => "admin"}.to_json
    body = JSON.parse(resp.body)
    resp = self.class.get "/api/home?login_token=#{body['login_token']}"
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
