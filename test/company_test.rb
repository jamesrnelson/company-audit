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

    expected = {success: true, error: nil}

    assert_equal expected, company.load_employees('./data/employees.csv')
  end

  def test_raises_error_if_bad_data

  end
end
