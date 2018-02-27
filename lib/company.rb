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
    CSV.foreach(filepath, headers: true, header_converters: :symbol) do |data|
      @employees << Employee.new(data)
    end
  end

end
