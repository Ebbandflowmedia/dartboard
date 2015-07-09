module MatchesHelper

  def scoreStatus(num)



  end

  def scoreClass(id, num, threshold)
    @score = Score.find(id)

    num_under = 'num_' + num.to_s
    status_under = 'status_' + num.to_s
    number = @score.read_attribute(num_under)

    if @score.read_attribute(status_under) == true
      'warning'
    elsif number >= threshold
      'success'
    else
      ''
    end
  end

end
