class Grade < ActiveRecord::Base
  def self.keys
    all.map(&:key)
  end
end
