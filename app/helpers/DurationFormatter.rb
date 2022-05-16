module DurationFormatter
  def hours_literal(hours)
    return 'hours' if hours > 1

    'hour'
  end
  module_function :hours_literal

  def minutes_literal(minutes)
    return 'minutes' if minutes != 1

    'minute'
  end
  module_function :minutes_literal

  def format_by_minutes(minutes)
    hours = minutes / 60
    minutes = minutes.modulo(60)

    hours_text = hours.nonzero? && "#{hours} #{hours_literal(hours)},"
    conjunction_text = hours.nonzero? && minutes.nonzero? ? ' and ' : ' '
    minutes_text = "#{minutes}#{conjunction_text}#{minutes_literal(minutes)}"

    "#{hours_text} #{minutes_text}"
  end
  module_function :format_by_minutes
end
