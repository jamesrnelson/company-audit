require './test/test_helper'
require './lib/employee'

class EmployeeTest < Minitest::Test
  def test_instantiation
    employee = Employee.new('5', 'Sally Jackson', 'Engineer', '2015-01-01', '2018-01-01')

    assert_instance_of Employee, employee
  end

  def test_attributes
    start_date = Date.new(2015, 1, 1)
    end_date = Date.new(2018, 1, 1)
    employee = Employee.new('5', 'Sally Jackson', 'Engineer', '2015-01-01', '2018-01-01')

    assert_equal 5, employee.employee_id
    assert_instance_of Integer, employee.employee_id
    assert_equal 'Sally Jackson', employee.name
    assert_equal 'Engineer', employee.role
    assert_equal start_date, employee.start_date
    assert_equal end_date, employee.end_date
  end
end
