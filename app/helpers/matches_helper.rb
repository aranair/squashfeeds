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
          date.strftime("#{date.day.ordinalize} %b %Y")
        end
    (diff <= 0) ? "Playing #{s}" : "Played #{s}"
  end

  def format_full_result(result, score)
    result == 'Unplayed' ? '-' : "#{result} (#{format_score(score)})"
  end

  def format_score(score)
    "#{score}-#{4 - score}"
  end

  def render_match_title(match)
    result = match.result
    score = match.score
    if result == 'Unplayed'
      "#{match.grade.upcase}-grade. \n 
      Against #{match.opponent.capitalize}"
    else
      "#{match.grade.upcase}-grade.  \n
      #{format_score(match.score)} #{result} Against #{match.opponent.split.map(&:capitalize).join(' ')}"
    end
  end
end
