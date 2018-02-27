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
    assert_equal 2, company.employees.length
  end

  def test_raises_error_if_bad_employee_data
    company = Company.new
    assert_equal [], company.employees

    expected = { success: false, error: 'bad data' }

    assert_equal expected, company.load_employees('./data/bad_employees.csv')
    assert company.employees.empty?
  end

  def test_loads_projects
    company = Company.new
    assert_equal [], company.projects

    expected = { success: true, error: nil }

    assert_equal expected, company.load_projects('./data/projects.csv')
    assert_equal 3, company.projects.length
  end

  def test_raises_error_if_bad_project_data
    company = Company.new
    assert_equal [], company.projects

    expected = { success: false, error: 'bad data' }

    assert_equal expected, company.load_projects('./data/bad_projects.csv')
    assert company.projects.empty?
  end

  def test_loads_timesheets
    company = Company.new
    assert_equal [], company.timesheets

    expected = { success: true, error: nil }

    assert_equal expected, company.load_timesheets('./data/timesheets.csv')
    assert_equal 25, company.timesheets.length
  end

  def test_raises_error_if_bad_timesheet_data
    company = Company.new
    assert_equal [], company.timesheets

    expected = { success: false, error: 'bad data' }

    assert_equal expected, company.load_timesheets('./data/bad_timesheets.csv')
    assert company.timesheets.empty?
  end
end
