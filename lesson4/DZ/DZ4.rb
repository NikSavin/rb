arr = ['cat','dog','tiger']
p arr.select { |x| x.index('t') }

p arr.map { |x| x.upcase }
p arr.map(&:upcase).map(&:downcase)
p arr.map(&:upcase).tap { |x| puts x } .map(&:downcase)


p %i(first second third).each_with_index.map { |v, i| p [v, i + 1] }.to_h

#p [*1..10].map { |x| x * x }
#p hash = { first: 1, second: 2, third: 3}
#p hash.map { |k, v| [v, k] }.to_h

def my_map(arr)#метод принемает значение в качестве параметра
  coll = arr.dup# получаем копию коллекции
  coll.map do |x|# Обходим коллекцию при помощи итератора map
  	yield x
  end
end

p my_map([*1..10]) { |x| x * x }
hash = { first: 1, second: 2, third: 3 }
p my_map(hash) { |k, v| [v, k] }.to_h

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
  end

  def mark
  	@mark
  end
end

user = User.new

print 'Ввведите имя пользователя'
user.name = gets.chomp

loop do
print 'Введите оценку от 1 до 5'
mark = gets.to_i
  if (1..5).include? mark
  	user.mark = mark
    break
  end
end

