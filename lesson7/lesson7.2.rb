# Множество set отличается от массивов и хешей тем что может содержать только уникальные элементы.
# Подключить сет напрямую нельзя!Прежде чем воспользоваться сет нужно подключить его через require.Только в этом случае мы можем воспользоваться классом сет.
# reuqire 'set'

# =====  ДАЛЕЕ ВСЕ ПРИМЕРЫ БУДУТ ИЗ irb.  =====

# Посмотрим цепочку наследования класса Set
# Set.ancestors => [Set, Enumerable, Object, Kernel, BasicObject] 
# Как мы видим класс сет включает в себя модуль Enumerable, тоесть это тоже коллекция языка руби и поддерживает все методы которые рассматривались в предыдущем уроке lesson7.1.rb .
# Создать коллекцию сет можно при помощи метода new.
# Set.new => #<Set: {}> 
# Что бы заполнить множество воспользуемся готовым массивом который содержит дни недели.
# week = %w[Monday Tuesday Wednesday Thursday Friday Saturday Sunday] => ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"] 
# Преобразуем данныу коллекцию в множество:
# week = Set.new(week) => #<Set: {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"}> 
# Как видим наша коллекция заполнена.
# Если мы сейчас попробуем добавить в нашу коллекцию уже существующий день недели например Friday у нас ничего не выйдет:
# week << 'Friday' => #<Set: {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"}> 
# Множество не изменяеться оно поддерживает только уникальные элементы.
# Любой новый элемент легко вставляеться в множество, однако попытка вставить уже существующий элемент приводит к тому что коллекция остаеться неизменой.
# week << 'Fiday' => #<Set: {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday", "Fiday"}> 
# Удалить элемент можно при помощи метода delete.
# week.delete 'Fiday' => #<Set: {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"}> 

# Создадим к дополнению множества week создадим еще одно множество weekend.
# weekend = Set.new %w(Saturday Sunday) => #<Set: {"Saturday", "Sunday"}>  
# Множесто можно вычитать друг из друга.Получим количество рабочих дней.
# everyday = week - weekend => #<Set: {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday"}> 
# Допускаеться и сложение множеств.
# everyday + weekend => #<Set: {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"}> 
# Все перации что мы выполняли с массивами доступны и для множеств.
# Например мы хотим получить пересечение рабочих и выходных дней:
# week & weekend => #<Set: {"Saturday", "Sunday"}> # Ищет одинаковые элементы в рабочих днях и выходных.
# Получаем только субботу и воскресенье.

# Ещё один класс для построения множеств и структур это Struct.
# Как и в предыдущий коллекции Set, Struct включает в себя модуль Enumerable.
# Struct.ancestors => [Struct, Enumerable, Object, Kernel, BasicObject]
# Для того чтобы посмотреть на Struct создади класс точки в двухмерной системе координат:

# Класс будет поддерживать 2 инстанс переменные @x и @y которые мы будем инициалезировать в методе initialize.
=begin
class Point
  attr_accessor :x, :y

  def initialize(x=nil, y=nil)
  	@x = x
  	@y = y
  end
end
=end

# Создать точно такой же класс как выше можно и более коротким способом если мы воспользуемся Struct.
# Struct позволяет получить такой же класс Point, в одну строку.
Point = Struct.new(:x, :y)
# Создадим парочку объектов данного класса чтобы посмотреть как они работают.
# Первый объект создает точку с координатами х=3 y=4.
point = Point.new(3, 4)
p point
# Дамп при создании объекта с помощью класса Point (#<Point:0x00007f985f03ef18 @x=3, @y=4>)
# Дамп при создании с помощью Point = Struct.new #<struct Point x=3, y=4>
# Второй объект создает точку с неопределенными координатамию.
point = Point.new
p point
# Дамп при создании объекта при помощи класса Point(#<Point:0x00007f985f03ed38 @x=nil, @y=nil>)
# Дамп при создании Point = Struct.new #<struct Point x=nil, y=nil>

# Посмотрим на свойства полученных объектов при помощи консоли.
# Воспроизводим ситуацию в irb и посмотрим какими свойствами и методами обладает объект point.
# Point = Struct.new(:x,:y) => Point 
# point = Point.new(3,4) => #<struct Point x=3, y=4> 
# Мы можем обращаться к координатам x и y используя одноименные методы.
# point.x => 3
# point.y => 4
# Мы можем обращаться с объектом point как с хешом.Причем будут работать как строки так и символы:
# point['x'] => 3
# point['y'] => 4
# point[:x] => 3
# point[:y] => 4
# Мы можем воспользоваться методами которые поддерживает Enumerable.
# Например мы можем посмотреть имена атрибутов которые поддерживает текущий объект класса Struct:
# point.members => [:x, :y] 
# Можем обходить элементы коллекции point как в случае обычного массива:
# point.each {|i| puts i}
# 3
# 4
# => #<struct Point x=3, y=4> 
# Мы можем обходить point как коллекцию {ключ, значение}
# point.each_pair {|k, v| puts "#{k} => #{v}" }
# x => 3
# y => 4
# => #<struct Point x=3, y=4> 
# Полученные из Struct объекты уже поддерживают сравнение!
# Например можно сравнить две точки в системе координат:
# Point.new(3, 7) == Point.new(3, 7) => true
# Point.new(3, 7) == Point.new(7, 3) => false

# На практике мы будем встречаться OpenStruct он более удобен в работе.Однако воспользоваться на прямую им не получиться.
# OpenStruct нужно подключить при помощи require. Для этого мы обращаемся к библиотеке ostruct.
# Конструкция OpenStruct в отличии от Struct принимает в качестве параметра хеш.

# Подключим OpenStruct.
require 'ostruct'
# Создадим хеш.
o = {
 key: 'value',
 hello: 'world'
}
# Инициалезируем хешем о конструктор OpenStruct.
os = OpenStruct.new(o)
# Посмотрим на дамп полученного объекта.
p os
# Видим что мы получаем коллекцию ключ, значение:
# #<OpenStruct key="value", hello="world">

# Посмотрим теперь на этот пример в irb и создадим объект OpenStruct.
# os = OpenStruct.new(key: 'value', hello: 'world') => #<OpenStruct key="value", hello="world"> 
# Можно обращаться к элементам коллекции при помощи ключей.  
# Например извлечь ключ:
# os.key => "value" 
# os.hello => "world" 
# Можем пополнять коллекцию новыми ключами:
# os.try = 'new value' => "new value" 
# os => #<OpenStruct key="value", hello="world", try="new value"> 

# Struct и OpenStruct очень похожи друг на друга только OpenStruct дает сразу эти объекты, а Struct своеобразные псевдо классы этих объектов.
# Создадим точку с координатами x=3, y=7 используя Struct и OpenStruct:
# В случае Struct нам нужно сначала создать структуру объекта Struct.new(:x, :y) и лишь потом воспользоваться конструктором .new(3, 7):
# Struct.new(:x, :y).new(3, 7) => #<struct x=3, y=7> 
# В OpenStruct мы можем сразу указать ключи и значения:
# OpenStruct.new(x: 3, y: 7) => #<OpenStruct x=3, y=7> 