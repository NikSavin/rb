class Cat
  attr_accessor :name, :color

  def initialize(name, color)
  	@color = color
  	@name = name
  end

end

cats = 3.times.map do
	     puts 'Введите имя кота.'
		 name = gets.chomp
		 puts 'Введите цвет кота.'
		 color = gets.chomp

		 Cat.new(name, color)
		end

p cats
=begin

cats = []

3.times do
puts 'Введите имя кота.'
name = gets.chomp
puts 'Введите цвет кота.'
color = gets.chomp
cats << Cat.new(name, color)
end

p cats
=end

__END__
class User
  def name=(name)
  	@name = name
  end

  def name
  	@name
  end

  def mark=(mark)
  	@mark = mark
  	if (1..5).include? mark
  		@mark = mark
  	else
  		@mark = 5
  	end
  end

  def mark
  	@mark
  end
end

def make_user(name, mark)
  user = User.new
  user.name = name
  user.mark = mark
  user
end

users = []

puts 'Name'
name = gets.chomp
puts 'Mark'
mark = gets.to_i

users << make_user(name, mark)

puts 'Name'
name = gets.chomp
puts 'Mark'
mark = gets.to_i

users << make_user(name, mark)

puts 'Name'
name = gets.chomp
puts 'Mark'
mark = gets.to_i

users << make_user(name, mark)

p users