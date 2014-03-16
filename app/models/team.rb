class Team < ActiveRecord::Base
  validates_numericality_of :points_a, :points_b, :points_c, :points_d, :points_e, :points_f

  def self.for_grade(grade, allow_null = false)
    if allow_null 
      order("points_#{grade.downcase} DESC")
    else
      where("points_#{grade.downcase} IS NOT NULL").order("points_#{grade.downcase} DESC")
    end
  end
end
