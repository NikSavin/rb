def colors(index)
  colors = ['красный','оранжевый','желтый','зеленый','голубой','синий','фиолетовый']
  colors[index - 1]
end

puts colors(3) #Позволяет выводить цвет по индексу

index = rand(7) + 1 #Позволяет генерировать случайный цвет
puts colors(index) #Позволяет вывести случайный цвет который сгенерировался в строке выше.

print 'Введите индекс цвета (1-7)'
index = gets.to_i

color = colors(index)
if color.nil?
	puts 'Не верный индес цвета'
else
	puts color
end

__END__

def colors(index)
  case index
  when 1
    'красный'
  when 2
  	'оранжевый'
  when 3
  	'желтый'
  when 4
  	'зеленый'
  when 5
  	'голубой'
  when 6
  	'синий'
  when 7
  	'фиолетовый'
  end
end

puts colors(1)
p colors(10)