# -*- encoding : utf-8 -*-
class DeviceInfo < GlobalBase
  include Mongoid::Document
  include Mongoid::Timestamps

  field :platform,    type: String
  field :os_version,  type: String

  embedded_in :uniq_user
end
