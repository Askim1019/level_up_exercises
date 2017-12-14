class NameCollisionError < RuntimeError
end

class Robot
  attr_accessor :name

  @@registry ||= []

  def initialize(args = {})
    @name_generator = args[:name_generator] || -> { normal_name_generator }
    generate_name
    register_name
  end
  
  def generate_name
    @name = @name_generator.call
    
    if !(name =~ /[[:alpha:]]{2}[[:digit:]]{3}/) || @@registry.include?(name)
      raise NameCollisionError, 'There was a problem generating the robot name!'
    end
  end
  
  def normal_name_generator
    "#{generate_char}#{generate_char}#{generate_num}#{generate_num}#{generate_num}"
  end
  
  def generate_char
    ('A'..'Z').to_a.sample
  end
  
  def generate_num
    rand(10)
  end
  
  def register_name
    @@registry << @name
  end
end


robot = Robot.new
puts "My pet robot's name is #{robot.name}, but we usually call him sparky."

# Errors!
# generator = -> { 'AA111' }
# Robot.new(name_generator: generator)
# Robot.new(name_generator: generator)
