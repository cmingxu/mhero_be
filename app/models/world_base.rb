# -*- encoding : utf-8 -*-
class WorldBase
  def self.switch_to_db(db_name)
    self.subclasses.each do |sub|
      sub.store_in :database => db_name
    end
  end
end
