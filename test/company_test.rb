require './test/test_helper'
require './lib/company'
require 'csv'

class CompanyTest < Minitest::Test
  def test_instantiation
    company = Company.new

    assert_instance_of Company, company
  end

  def test_empty_arrays
    company = Company.new

    assert_equal [], company.employees
    assert_equal [], company.projects
    assert_equal [], company.timesheets
  end

  def test_loads_employees
    company = Company.new

    assert_equal [], company.employees

    company.load_employees('./data/employees.csv')
    refute company.employees.empty?
  end

  def test_raises_error_if_bad_data

  end
end
