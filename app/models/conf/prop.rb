module Conf
  class Prop
    include Mongoid::Document

    PROP_TYPE = %w(helmet glove armor boots ring glasses)

    field :type, type: String
    field :name, type: String
  end
end
