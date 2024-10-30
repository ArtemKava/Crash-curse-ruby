require 'date'

class Student
  @@students = []
  attr_accessor :surname, :name, :date_of_birth

  def initialize(surname, name, date_of_birth)
    @surname = surname
    @name = name
    if Date.parse(date_of_birth) < Date.today
      @date_of_birth = Date.parse(date_of_birth)
    else
      raise ArgumentError, 'Date of birth must be in the past'
    end
  end

  def calculate_age
    Date.today.year - @date_of_birth.year
  end

  def add_student
    unless @@students.include?(self)
      @@students << self
    else
      puts "Student already added"
    end
  end

  def remove_student
    if @@students.include?(self)
      @@students.delete(self)
    else
      puts "Student dont exist"
    end
  end

  def self.get_students_by_age(age)
    ret_students = []
    @@students.each{|i| ret_students << i if i.calculate_age == age}
    if ret_students.length > 0
      ret_students
    else
      "There are no students of this age"
    end
  end

  def self.get_students_by_name(name)
    ret_students = []
    @@students.each{|i| ret_students << i if i.name == name}
    if ret_students.length > 0
      ret_students
    else
      "There are no students of this name"
    end
  end
end

st1 = Student.new("Kovalenko", "Artem", "2007-03-13")

begin
  st2 = Student.new("Chernenko", "Yaroslav", "2037-03-13")
rescue => e
  puts "Error: #{e}"
end

p st1.calculate_age
st1.add_student
st1.add_student
p Student.get_students_by_age(17)
p Student.get_students_by_age(20)
p Student.get_students_by_name("Artem")
p Student.get_students_by_name("Yaroslav")
st1.remove_student
st1.remove_student
