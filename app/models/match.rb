class Match < ActiveRecord::Base
  def self.for_grade(grade, allow_null = false)
    if allow_null 
      order("points_#{grade.downcase} DESC")
    else
      where("points_#{grade.downcase} IS NOT NULL").order("points_#{grade.downcase} DESC")
    end
  end
end
