require './test/test_helper'
require './lib/timesheet'

class TimesheetTest < Minitest::Test
  def test_instantiation
    timesheet = Timesheet.new('5', '7', '2015-01-01', '120')

    assert_instance_of Timesheet, timesheet
  end

  def test_attributes
    date = Date.new(2015, 1, 1)
    timesheet = Timesheet.new('5', '7', '2015-01-01', '120')

    assert_equal 5, timesheet.employee_id
    assert_instance_of Integer, timesheet.employee_id
    assert_equal 7, timesheet.project_id
    assert_instance_of Integer, timesheet.project_id
    assert_equal date, timesheet.date
    assert_instance_of Date, timesheet.date
    assert_equal 120, timesheet.minutes
    assert_instance_of Integer, timesheet.minutes
  end
end
