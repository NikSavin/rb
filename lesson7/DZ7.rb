# 1. Пусть имеется хэш { red: 'красный', orange: 'оранжевый', yellow: 'желтый', green: 'зеленый', blue: 'голубой', indigo: 'синий', violet: 'фиолетовый' }. 
# Превратите его в хэш { 'красный' => 'red', 'оранжевый' => 'orange', 'желтый' => 'yellow', 'зеленый' => 'green', 'голубой' => 'blue', 'синий' => 'indigo', 'фиолетовый' => 'violet' }.

include Enumerable

has = { red: 'красный', orange: 'оранжевый', yellow: 'желтый', green: 'зеленый', blue: 'голубой', indigo: 'синий', violet: 'фиолетовый' }
has.each { |key, value| puts "'#{value}' => '#{key}'"   }

# 2. Преобразуйте массив вида %w[first second third] в хэш вида {first: 'Fst (1)', second: 'Snd (2)', third: 'Trd (3)'}. Выражение преобразования должно быть однострочным.

m = %w[first second third]
# Вырезаем первый символ используя индекс 0 вырезать два последних элемента можно используя отрицательное смещение -2,2
p m.map { |x| "#{x[0]}#{x[-2,2]}" } 
# Делаем первую букву заглавной при помощи метода Capitalize.
p m.map { |x| "#{x[0]}#{x[-2,2]}" }.map(&:capitalize)
# Добавляем цифры в круглых скобках после каждого элемента.
p m.map { |x| "#{x[0]}#{x[-2,2]}" }.map(&:capitalize).each_with_index.map {|v, i| "#{v} (#{i + 1})"}
# Добавили ключ передав его через первый элемент массива.Во втором map мы задействуем метод last и делаем заглавную букву с помощью метода capitalize.
p m.map { |x| [x.to_sym, "#{x[0]}#{x[-2,2]}"] }.each_with_index.map { |v, i| "#{v.last.capitalize} (#{ i + 1})"}
# Забрасываем во второй map значение ключ, символ. Получаем массив массивов и преобразовываем его в хеш.
p m.map { |x| [x.to_sym, "#{x[0]}#{x[-2,2]}"] }.each_with_index.map { |v, i| [ v.first, "#{v.last.capitalize} (#{ i + 1})"] }.to_h

# Имеется два массива %w[red orange yellow green gray indigo violet] и
# %w[красный оранжевый желтый зеленый голубой синий фиолетовый]. 
# Создайте из них хэш {red: 'красный', orange: 'оранжевый', yellow: 'желтый', green: 'зеленый', blue: 'голубой', indigo: 'синий', violet: 'фиолетовый'}

eng = %w[red orange yellow green gray indigo violet]
rus = %w[красный оранжевый желтый зеленый голубой синий фиолетовый]
# Для того чтобы сопоставить один массив другому мы можем воспользоваться методом zip
p eng.zip(rus)
# Преобразовываем полученый массив в хеш при помощи метода to_h
p eng.zip(rus).to_h
# По условию наш ключ должен быть символом. Поэтому преобразуем английские названия цветов в символы.
p eng.map(&:to_sym).zip(rus).to_h

# 3. Пусть есть диапазон от 1 до 9 — (1...10). Преобразуйте его в массив из трех подмассивов [[1, 2, 3], [4, 5, 6], [7, 8, 9]].

p (1...10).each_slice(3).to_a

# 4. Возьмите текст этого задания и извлеките из него все слова, количество символов в которых больше 5. Подсчитайте количество слов и выведите их алфавитном порядке.

str = "Возьмите текст этого задания и извлеките из него все слова, количество символов в которых больше 5. Подсчитайте количество слов и выведите их алфавитном порядке."
# разбиваем строку при помощи метода split
puts str.split(' ')
puts '==================================='
# Чтобы извлечь слова которые превышают 5 символов мы можем воспользоваться итератором select
puts str.split(' ').select { |x| x.size > 5 }
puts '==================================='
# Отсортируем слова при помощи метода sort, уберем заглавные буквы при помощи метода downcase
puts str.split(' ').select { |x| x.size > 5 }.map(&:downcase).sort
puts '==================================='
# Подсчитать количество слов в массиве можно при помощи метода size.Воспользуемся промежуточным итератором tap что бы вывести результаты.
puts str.split(' ').select { |x| x.size > 5}.tap { |arr| puts arr.size }.map(&:downcase).sort
puts '==================================='
# Можно так же убрать точку и запятую в выводе результата. Используем регулярное выражение для того что бы разбить исходную фразу не только по пробельным символам, но и по знакам припенания.
str.split(/[\s\.,]+/).select { |x| x.size > 5}.tap { |arr| puts arr.size }.map(&:downcase).sort.each { |x| puts x }
puts '==================================='
# 5. Возьмите текст этого задания и извлеките из него все слова, которые начинаются с символа 'и'. Сформируйте из них список уникальных слов и выведите их в порядке увеличения количества символов в слове.
# Сразу преобразуем наш текст в строку
str = "5. Возьмите текст этого задания и извлеките из него все слова, которые начинаются с символа 'и'. Сформируйте из них список уникальных слов и выведите их в порядке увеличения количества символов в слове."
# Разбиваем фразу при помощи split.С помощью регулярных выражений убираем символы.Select отсортировывает с помощью метода start_with? все строки в которых слова начинаються на "и".
# sort сортирует в алфавитном порядке.Метод uniq убирает повторяющиеся значения и оставляет только уникальные.
puts str.split(/[\s\.\',]+/).select { |x| x.start_with? 'и' }.sort.uniq

# 6. *Разработайте программу, которая подсчитывает количество файлов с расширением .rb в текущей папке, включая все вложенные подпапки.
# Начинаем со сканирования текущей папки которое обозначаеться точкой ('.').Мы можем передать путь к текущей папке при помощи строки, однако удобнее воспользоваться встроенным классом Pathname с которым более удобно оперировать файловыми путями.
# Чтобы восползоваться Pathname нам нужно подключить его при помощи метода require.
require 'pathname'

path = Pathname('.')
some = Dir.new(path).entries
# Посмотрим на список наших директорий
p some
puts '================================='
# Избавимся от папок . и .. которые указывают на родительскую директорию
some = Dir.new(path).reject { |x| %w[. ..].include? x }
# Убедимся что исчезли директории . и ..
p some

some = Dir.new(path).reject { |x| %w[. ..].include? x }.map { |x| path.join x }
# Обойдем верхний уровень папки и выполним процедуру сканирования повторно.
# Мы извлекаем расширение при помощи метода extname
counter = 0
some.each do |item|
  counter += 1 if item.extname == '.rb'
end

puts counter
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#


