module TeamHelper
  def render_team_points(team, grade)
    content_tag(:td, team.send("points_#{@grade}").to_s) if @grade == grade
  end
  
  def render_team_header(grade)
    content_tag(:th, "Points") if @grade == grade
  end
end
