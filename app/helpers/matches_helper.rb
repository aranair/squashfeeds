module MatchesHelper
  def format_index_date(match)
    date = match.date
    diff = (Date.today - date).to_i
    s = case diff
        when 0
          'Tonight'
        when 1
          "Yesterday"
        when -1
          'Tomorrow'
        when -2..0
          "#{-diff} days later"
        when 2..7
          "#{diff} days ago"
        else
          date.strftime("#{date.day.ordinalize} %b (%a)")
        end
    if match.result == 'Victory' || match.result == 'Loss'
      "Played #{s}"
    else
      # Unplayed
      if diff <= 0
        "Playing #{s}"
      else
        "Should have played #{s}. Update pls."
      end
    end
    (diff <= 0) ? "Playing #{s}" : "Played #{s}"
  end

  def format_full_result(result, score)
    result == 'Unplayed' ? '-' : "#{result} (#{format_score(score)})"
  end

  def format_score(score)
    "#{score}-#{4 - score}"
  end

  def camel_each(str)
    str.split.map(&:capitalize).join(' ')
  end

  def render_match_title(match)
    result = match.result
    score = match.score
    if result == 'Unplayed'
      "#{match.grade.upcase}-grade. \n 
      Against #{camel_each(match.opponent)}"
    else
      "#{match.grade.upcase}-grade.  \n
      #{format_score(match.score)} #{result} Against #{camel_each(match.opponent)}"
    end
  end
end
