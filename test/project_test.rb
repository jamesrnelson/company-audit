require './test/test_helper'
require './lib/project'

class ProjectTest < Minitest::Test
  def test_instantiation
    project = Project.new('123', 'Widget Maker', '2015-01-01', '2018-01-01')

    assert_instance_of Project, project
  end

  def test_attributes
    start_date = Date.new(2015, 1, 1)
    end_date = Date.new(2018, 1, 1)
    project = Project.new('123', 'Widget Maker', '2015-01-01', '2018-01-01')

    assert_equal 123, project.project_id
    assert_instance_of Integer, project.project_id
    assert_equal start_date, project.start_date
    assert_equal end_date, project.end_date
  end
end
