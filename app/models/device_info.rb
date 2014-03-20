class DeviceInfo < GlobalBase
  include Mongoid::Document
  include Mongoid::Timestamps

  field :platform,    type: String
  field :os_version,  type: String

  embeded_in :uniq_user
end
