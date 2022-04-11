print 'Введите пожалуйста число.'

n = gets.to_i

if n < 0
  puts 'число меньше 0'
elsif n > 0
  puts'число больше 0'
else
  puts'число равно 0'
end

__END__

puts 'Начало программы '

if RUBY_VERSION == '2.4.2'
  puts 'Тело оператора ветвления.'
else
	puts 'Старая версия.'
end

puts 'Завершение программы'