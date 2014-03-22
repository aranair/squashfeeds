module GradeHelper
  def render_grade_link(grade, type = "show")
    link_to(params.merge(grade: grade)) do
      button_tag(type: 'button', :class => "btn #{active_btn_class(grade)}") do
        content_tag(:span, grade.upcase)
      end
    end
  end

  def active_btn_class(grade)
    @grade == grade ? 'btn-amethyst' : 'btn-default'
  end
end
