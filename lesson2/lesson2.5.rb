#Рекурсивные методы
def fact(number) #Mетод вычисления факториала.
  return 1 if number <= 1 #Точка возврата,для того чтобы у нас начался хвост рекурсии.Чтобы мы начали получать результаты
  number * fact(number - 1) 
end

puts fact(5) 
__END__

#Синглитон методы
object = Object.new
#object1 = Object.new

def object.say_hello #Так как метод определен только для объекта object, для объекта object1 метод не сработает.Такие методы называются синлитон методами.
  'hello'
end

puts object.say_hello if object.respond_to? 'say_hello' # <= hello. Здесь мы используем if модификатор и вызываем метод say_hello только в том случае если объект отзывается на него.
#puts object1.say_hello if object1.respond_to?'say_hello' # <= error. respond_to - этот метод есть у каждого объекта.Мы можем передать ему название метода и если мы можем вызывать его нам вернется true.

#Вызов метода у неопределенного значения.
var = nil

#....
  #Много кода
#....

var&.say_hello # & Помогает избежать ошибки если значение переменной евляется nil или если метод не может быть приминен для данного объекта.


#Псевдоним метода.
def convert(value:, factor:)
  value * factor
end

alias gram_to_kg convert #alias ключивое слово - это не метод, поэтому запятой между аргументами нет. gram_to_kg - псевдоним метода, convert - название метода которому присваивается псевдоним. 

puts gram_to_kg(value: 12, factor: 23)

#Обработка не существующих методов (m) - metod missing
class HelloWorld
  def metod_missing(m)
  	puts m
  	puts 'Такого метода нет'
  end
end

hello = HelloWorld.new
hello.world