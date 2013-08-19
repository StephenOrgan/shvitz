module ScheduleAttributes::RuleParser
  # Parse an options hash to a monthly rule
  #
  # Assume a monthly rule starting on the :start_date if no :ordinal_day or
  # :ordinal_week is given. If both of these options are present in the options
  # hash, one can be selected with :ordinal_unit = ("day" or "week").
  #
  # Weekdays are applied for :ordinal_week only
  #
  class Month < Base

    private

    # @return [IceCube::Rule]
    #
    def parse_options
      @rule = IceCube::Rule.monthly(input.interval)

      case input.ordinal_unit
      when :day
        @rule.day_of_month(input.ordinal_day)
      when :week
        # schedule.add_recurrence_rule Rule.monthly.day_of_week(:tuesday => [1, -1])
        # every month on the first and last tuesdays of the month
        @rule.day_of_week(weekdays_by_week_of_month)
      else
        @rule
      end
    end

    def weekdays_by_week_of_month
      Hash[selected_weekdays.map { |wd| [wd, Array(input.ordinal_week)] }]
    end

    def selected_weekdays
      input.weekdays.any? ? input.weekdays : ScheduleAttributes::DAY_NAMES
    end

  end
end
