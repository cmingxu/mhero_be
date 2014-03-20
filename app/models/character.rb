class Character < WorldBase
  include Mongoid::Document

  embedded_in :canvas
end
