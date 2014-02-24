class World < GlobalBase
  include Mongoid::Document
  field :name, type: String
  field :account_count, type: Integer
end
