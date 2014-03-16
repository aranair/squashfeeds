module TeamHelper
  # A B C D E F
  def render_grade_link(grade, type = "show")
    path_args = if type == 'show'
                  teams_path(params.merge(grade: grade))
                else
                  edit_teams_list_path(params.merge(grade: grade))
                end
    link_to path_args do 
      button_tag(
        type: 'button', 
        class: "btn #{@grade == grade ? 'btn-primary' : 'btn-default'}") do
        content_tag(:span, grade.upcase)
      end
    end
  end

  def render_team_points(team, grade)
    content_tag(:td, team.send("points_#{@grade}").to_s) if @grade == grade
  end
  
  def render_team_header(grade)
    content_tag(:th, "Points") if @grade == grade
  end
end
