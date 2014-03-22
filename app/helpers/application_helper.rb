module ApplicationHelper
  def get_top_back_url
    p_controller = params[:controller] 
    p_action = params[:action]
    case p_controller
    when 'matches'
      case p_action
      when 'show'
        matches_path
      when 'index'
        ''
      when 'edit'
        matches_path
      end
    when 'team'
    end
  end

  def get_top_content_title
    p_controller = params[:controller] 
    p_action = params[:action]
    case p_controller
    when 'matches'
      case p_action
      when 'show'
        '< Back to List'
      when 'index'
        'UCSC'
      when 'edit'
        '< Back to List'
      end
    when 'team'
    end
  end
end
