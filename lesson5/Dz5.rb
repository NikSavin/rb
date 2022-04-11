
class User
  attr_accessor :name, :surname, :lastname

  def initialize (name:, surname:, lastname:)
  	@name = name
  	@surname = surname
  	@lastname = lastname
  end

  def to_a
  	[@surname, @name, @lastname]
  end

  def to_s_user
 	to_a.join(' ')# Объединение элементов массива и выводим их строкой с помощью метода join и вывод их через пробел(" ").
 	#"Name: #{name}, surname: #{surname}, lastname: #{lastname}"
   end

  alias to_str to_s_user #метод для сложения объекта со строкой.
  alias full_name to_s_user#Метод выводит полное ФИО

end

#nametest = User.new(name: 'Николай', surname: 'Савин', lastname: 'Владимирович')

#puts 'Привет, ' + nametest.full_name + '!'
#p nametest.to_a

__END__

class Hello
	attr_accessor :arg
	def initialize(arg:)
	 @arg = arg
	end

	def say
	 'Hello'
	end

	def to_s
	  "#{say}, #{arg}!"
	end
end

test1 = Hello.new(arg: 'world')

puts "#{test1}"
