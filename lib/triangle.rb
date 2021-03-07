require 'pry'

class Triangle

  attr_accessor :side1, :side2, :side3

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def kind
    triangle = [@side1, @side2, @side3]

    if triangle.any? {|i| i <= 0} == true || self.is_triangle? == false
      raise TriangleError
      
      # begin
      #   raise TriangleError
      # rescue => exception
      #   puts exception.message
        
      # end

    elsif triangle.detect {|i| triangle.count(i) > 1} == nil
      return :scalene

    elsif triangle.uniq.size <= 1
      return :equilateral

    else
      return :isosceles

    end

  end

  def is_triangle?
    sorted = [@side1, @side2, @side3].sort
    greatest_side = sorted.pop
    greatest_side < sorted.sum
  end

 
  class TriangleError < StandardError
    def message
      "This isn't a valid triangle!"
    end
  end
   

end

# tri1 = Triangle.new(-1,3,4)
# binding.pry
# tri1.kind
