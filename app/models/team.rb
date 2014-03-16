class Team < ActiveRecord::Base
  def self.for_grade(grade)
    where("points_#{grade.downcase} IS NOT NULL").order("points_#{grade.downcase} DESC")
  end
end
