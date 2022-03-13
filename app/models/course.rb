class Course < ApplicationRecord

  def self.get_teaching_period(teaching_period_no)

    if teaching_period_no == 10
      @teaching_period = 'Semester 1'
    elsif teaching_period_no == 20
      @teaching_period = 'Semester 2'
    elsif teaching_period_no == 05
      @teaching_period = 'Summer School'
    elsif teaching_period_no == 15
      @teaching_period = 'Winter School'
    end
    @teaching_period
  end

end
