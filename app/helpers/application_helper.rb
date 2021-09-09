module ApplicationHelper
  def percentage(numerator, denominator)
    (numerator.to_f / denominator * 100).round
  end
end
