class Bob

  def hey(value)
    if value == nil || value.empty? || value.strip.empty?
      "Fine. Be that way!"
    elsif value == value.upcase && value != value.downcase
      "Woah, chill out!"
    elsif value.end_with?('?')
      "Sure."
    else
      "Whatever."
    end
  end

end