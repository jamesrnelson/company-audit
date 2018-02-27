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
    results = Hash.new(success: true, error: nil)
    CSV.foreach(filepath) do |data|
      if data.length != 5
        results[:success] = false
        break
      else
        @employees << Employee.new(data[0], data[1], data[2], data[3], data[4])
      end
    end
    results
  end
end
