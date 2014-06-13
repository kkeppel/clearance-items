class Status < ActiveRecord::Base
  has_many :items

  def self.clearanced_id
    find_by_name("clearanced").id
  end
  
end