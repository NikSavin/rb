def convert(value:, factor: 1024) #Здесь мы используем позиционные параметры (value:, factor:) чтобы параметры были позиционными нужно поставить знак :
  value * factor
 end

 puts convert(value: 11, factor: 1000)# Обычно по цифрам трудно понять что использует тот или иной аргумент, если мы используем позиционные параметры то подсказки помогают нам разобраться что использует тот или иной аргумен.

__END__

def  convert 
	5 * 1000
end

puts convert


def convert(value) #Параметры метода.
  value * 1000
end

puts convert(11) #Обязательно вводить параметры метода.Параметр в скобках называется аргумент.

def convert(value, factor = 1000)
  value * factor
end

puts convert(12) #
puts convert(12, 1024)


def multi_args(a,b, *x) # Чтобы в метод можно было вводить неограниченное количество параметров необходимо воспользоватся сплат оператором ;
   puts 'Могу принять неограниченное количество параметров'
   p a
   p b
   p x
end

multi_args(1,2,3,4)


def convert(value, factor = 1000)
 #return value * 1000 if RUBY_VERSION == '2.4.2' #Можео воспользоватся if  модефикатором чтобы немного сократить код с 4 строчек до 2-х
 #value * factor
 if RUBY_VERSION == '2.4.2'
 	return value * 1000 # Для того чтобы досрочно покинуть метод мы используем оператор return
 	value * factor
end

puts convert(11)