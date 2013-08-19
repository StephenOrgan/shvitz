class Session < ActiveRecord::Base
  include IceCube
  #include ScheduleAttributes
  
  belongs_to :student
  belongs_to :user
  belongs_to :schedule

  attr_accessible :student_id, :user_id, :timeshift, :start_date, :recur, :status, :duration


	serialize :schedule, Hash

 before_save :schedule
#   def schedule=(new_schedule)
#   write_attribute(:schedule, RecurringSelect.dirty_hash_to_rule(new_schedule).to_hash)
# end

# def converted_schedule
#   the_schedule = Schedule.new(self.start_date)
#   the_schedule.add_recurrence_rule(RecurringSelect.dirty_hash_to_rule(self.schedule))
#   the_schedule
# end

def schedule=(new_schedule)
    write_attribute(:schedule, RecurringSelect.dirty_hash_to_rule(new_schedule).to_hash)
  end

#update_attributes(:status => 'active')
  def schedule
  	endtime = start_date + duration.seconds
  	day = start_date.wday
  	hour = start_date.hour
  	minute = start_date.min
    
    rulestr = Rule.weekly(1, day).hour_of_day(hour).minute_of_hour(minute)

    rule = start_date.strftime("%A")

    schedule = Schedule.new(start_date, :end_time => endtime)
    
    if recur == 1
    	schedule.add_recurrence_rule Rule.weekly(1, day).hour_of_day(hour).minute_of_hour(minute)
    	schedule.add_recurrence_time(start_date + 7.days)
      schedule
  		write_attribute(:schedule, schedule.to_hash)

  		schedule_yaml = 'Weekly on ' + rule + ' :: ' + start_date.strftime("%l") + ':' + start_date.strftime("%M") + ' ' + start_date.strftime("%p") + ' - ' + endtime.strftime("%l") + ':' + endtime.strftime("%M") + ' ' + endtime.strftime("%p")  
  		else
        rule = start_date.strftime("%A") + ', ' + start_date.strftime("%B") + ' ' + start_date.strftime("%d") + ', ' + start_date.strftime("%Y") + ' :: ' + start_date.strftime("%l") + ':' + start_date.strftime("%M") + ' ' + start_date.strftime("%p") + ' - ' + endtime.strftime("%l") + ':' + endtime.strftime("%M") + ' ' + endtime.strftime("%p")   
  			schedule
  			write_attribute(:schedule, schedule.to_hash)
  			schedule_yaml = rule.to_s
  	end
  end



end
