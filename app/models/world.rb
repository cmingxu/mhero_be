# -*- encoding : utf-8 -*-
class World < GlobalBase
  include Mongoid::Document
  field :name, type: String
  field :account_count, type: Integer
  field :enable, type: Boolean

end
