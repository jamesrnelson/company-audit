# Defines a company
class Company
  attr_reader :employees,
              :projects,
              :timesheets

  def initialize
    @employees = []
    @projects = []
    @timesheets = []
  end

  def load_employees(filepath)
    results = { success: true, error: nil }
    CSV.foreach(filepath) do |data|
      if data.length != 5
        results[:success] = false
        results[:error] = 'bad data'
        break
      else
        @employees << Employee.new(data[0], data[1], data[2], data[3], data[4])
      end
    end
    results
  end

  def load_projects(filepath)
    results = { success: true, error: nil }
    CSV.foreach(filepath) do |data|
      if data.length != 4
        results[:success] = false
        results[:error] = 'bad data'
        break
      else
        @employees << Project.new(data[0], data[1], data[2], data[3])
      end
    end
    results
  end
end
