require 'time'

class School

  attr_reader :start_time, :hours_in_school_day, :student_names
  def initialize(start_time, hours_in_school_day)
    @start_time = start_time
    @hours_in_school_day = hours_in_school_day
    @student_names = []
  end

  def add_student_name(name)
    @student_names << name
  end

  def end_time
    time = Time.parse(@start_time) + 60*@hours_in_school_day*60
    return time.strftime("%H:%M")
  end

  def is_full_time?
    @hours_in_school_day > 4
  end

  def standard_student_names
    cap_names = []
    @student_names.each do |name|
      cap_names << name.capitalize
    end
    return cap_names
  end

  def convert_end_time_to_clock_time
    clock12hour = Time.parse(end_time).strftime("%I:%M")
    if clock12hour[0] = "0"
      return clock12hour = clock12hour[1..-1]
    else
      return clock12hour
    end
  end
end
