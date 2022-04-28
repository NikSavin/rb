# Задание 1:
# Создать класс человека Person унаследовать от него классы посетителей User, aдминистраторов Admin и модераторов Moderator.Запретить возможность создание объектов класса Person.Всем объектам классов добавить возможность задавать фамилию, имя и отчество пользователя, а также получать эти сведения.

class Person
  attr_accessor :family, :name, :oldname

  private_class_method :new
end

class User < Person
public_class_method :new
end

class Admin < Person
public_class_method :new
end

class Moderator < Person
public_class_method :new
end

us = User.new
p us

#pr = Person.new
#p pr

# Задание 2:
# Создайте класс любого объекта, например, холодильника. Представьте, что с холодильником могут взаимодействовать мастера, которые его чинят и люди, которые им пользуются. Если скучно возиться с холодильником — придумайте свой пример. В примере должен быть класс и минимум два инстанс-метода класса, один из которых демонстрирует использование private-метода.

class Fridge
  def open
    puts 'Открыли дверь'
  end

  def close
  	puts 'Закрыли дверь'
  end

  def place(object)
    open
    puts "Положили на полку: #{object}"
    close
  end

  private 

  def open_back
  	puts 'Открыли крышку'
  end

  def close_back
    puts 'Закрыли крышку'
  end

  def change(object)
  	open_back
  	puts "Заменили #{object}"
    close_back
  end
end

class Master
  def change_master(fridge, object)
  	puts 'Начали замену'
  	fridge.send :change, object
  	puts 'Закончили замену'
  end
end

user = Fridge.new
master = Master.new

p master.change_master(user, :engine)
p user.place(:meat)

# 3 задание:
# *Пусть имеется фабрика, которая выпускает детские игрушки: плюшевый медвежонок, мяч, кубики. Создайте класс Factory, который имеет метод Factory.build, возвращающий объект классов BearCub, Ball или Cube, соответствующих одной из игрушек. В качестве параметра, метод должен принимать один из спимволов :bear_cub, :ball, :cube, по которым будет приниматься решение о том, объект какого класса следует вернуть.

#Для начала создаем класс игрушек.

=begin #!!!! Удалите =bеgin и =end чтобы раскомментировать решение задачи. !!!!

class BearCub
end

class Ball
end

class Cube
end
# Создаем класс Factory.
class Factory
#Вводим в класс константу TOYS которая представляе из себя хеш.В качестве ключа выступают символы игрушки bear_cub, ball, cube.В Качестве значения будут выступать классы BearCub, Ball, Cube. 
  TOYS = { bear_cub: BearCub, ball: Ball, cube: Cube } #Имена класса это обычные константы, они просто ссылаются на объект класса.Поэтому мы легко можем их использовать в качестве объекта внутри хеша.
#Теперь мы создаем синглетон метод self.build и передаем в него тип игрушки type
  def self.build(type)
# Т.к. у нас метод принимает символ мы можем напрямую воспользоваться хешом TOYS. 
# Далее мы должны создать объект переданного класса при помощи new.
    TOYS[type]&.new # Т.к. нам могут передать любой символ мы ставим амперсанд(&) для того что бы метод new вызывался лишь в том случае если type возвращает объект, а не nil.
  end
end
# Создадим медвежонка bear и мячик ball
bear = Factory.build(:bear_cub)
p bear
ball = Factory.build(:ball)
p ball

=end

#Альтернативный метод выполнения с помощью мета программирования:

#СРАЗУ СТОИТ ОТМЕТИТЬ ЧТО ЭТО СПОРНЫЙ ПРИЕМ ПРОГРАММИРОВАНИЯ.

#Представим что у нас нет класса игрушек BearCub, Ball, Cube

class FactoryMeta
  TOYS = %i[bear_cub ball cube] # Здесь мы используем синтакситеческий конструктор %i чтобы получить массив символов.
# В irb можно поэксперементировать с получением классов из массива TOYS
# Берем массив символов TOYS = %i[bear_cub ball cube]
# => [:bear_cub, :ball, :cube] 
# Преобразовываем массив символов в строки, по тому что символы мы не можем менять, а строки можем.
# TOYS.map { |x| x.to_s }
# => ["bear_cub", "ball", "cube"] 
# Для того чтобы строки были похожи на имена классов делаем буквы заглавными.
# TOYS.map { |x| x.to_s }.map(&:capitalize)
# => ["Bear_cub", "Ball", "Cube"]
# Все буквы заглавные но Bear_cub не похож на класс т.к. у него не заглавная буква С, а это нарушает правило кэмел кейса в названии классов.Давайте исправим это.
# Разбиваем словосочитание на отдельные слова и увеличиваем первую букву.
# TOYS.map { |x| x.to_s.split('_').map(&:capitalize) }
#  => [["Bear", "Cub"], ["Ball"], ["Cube"]] 
# Мы получили массив массивов, теперь мы можем соеденить внутренние массивы снова в строки при помощи метода join.
# TOYS.map { |x| x.to_s.split('_').map(&:capitalize).join }
# => ["BearCub", "Ball", "Cube"]
# Это уже похоже на название классов.Берем последний пример из консоли и переносим его в наш редактор.


# Создадим классовы метод который будет возвращать соответствующие классы для элементов массива bear_cub, ball, cube.
# Т.к. у нас уже есть 2 классовых метода klasses и build  мы можем их объеденить внутри идиомы class << self.
  class << self
    def klasses # Специально используем название метода klasses с первой буквой К вместо С для того чтобы избежать конфликтов с клчевым словом class
# Попробуем преобразовать массив TOYS в хеш который мы придумали в предыдущем варианте.
      @klasses ||= TOYS.map do |x|
# Здесь мы получаем название классов BearCub, Ball, Cube из преобразованного массива %i[bear_cub ball cube].
      	klass =  x.to_s.split('_').map(&:capitalize).join
# Создаем из наших названий BearCub, Ball, Cube константу. Сделать это можно при помощи метода const.set класса Object.
# Преобразуем наш объект klass в символ и создаем объект класса Class.
		Object.const_set(klass.to_sym, Class.new)
# Теперь нам нужно получить константу klass сделать это можно при помощи метода const.get того же класса Object
      	[x, Object.const_get(klass)] #Klass] # Возвращаем массив массивов[x, ] и здесь же у нас должен быть класс нашей игрушки [x, Klass].
# И когда мы вернем массив массивов, мы уже сможем воспоьзоваться методом to_h.
      end.to_h
    end

    def build(type)
      klasses[type]&.new
    end
  end
end

# Посмотрим на выполнение метода klasses где создается класс игрушки.
p FactoryMeta.klasses #Видим тот же самый код который у нас был в первом примере -  {:bear_cub=>BearCub, :ball=>Ball, :cube=>Cube}
# Проверяем наш код, и видим что у нас много предупреждений о переопределении констант( warning: already initialized constant BearCub, DZ6.rb:146: warning: previous definition of BearCub was here) .Чтобы от этого избавиться добавим инстанс переменную в метод klasses и инициалезируем ее только один раз.
cube = FactoryMeta.build(:cube)
p cube

ball = FactoryMeta.build(:ball)
p ball


# Задание 4:
# * Создайте класс судна. Унаследуйте от него два типа судов: с возможностью плавать под водой и над водой. С использованием полученных классов создайте:
# * атомную подводную лодку (ракеты, торпеды);
# * сухогруз для перевоза зерна (грузовой трюм, кран);
# * контейнеровоз (кран);
# * нефтяной танкер (грузовой трюм);
# * ракетный крейсер (ракеты);
# * военный транспорт (ракеты, грузовой трюм, кран).


# Создаем класс судна.
class Ship
  attr_accessor :speed # Задаем скорость.
end
# Создаем класс подводной лодки и наследуем его от класса судна.
class Submarine < Ship
  attr_accessor :deep # Добавляем погружение.
end
# Создаем класс корабля и наследуем его так же от класса судна.
class Boat < Ship
  attr_accessor :displancement # Добавляем водоизмещение.
end
# Создаем модуль ракет.
module MisseliShip
  attr_accessor :misseles # Ракеты 
end
# Создаем модуль торпед.
module TorpedoShip
  attr_accessor :torpedo # Торпеды 
end
# Создаем модуль трюм.
module CargoShip
 attr_accessor :hold # Трюм
end
# Создаем модуль кран.
module CraneShip
  attr_accessor :capacity # Кран
end


# Создаем класс атомной подводной лодки.
class AtomicWarSubmarine < Submarine
# Подмешиваем модули ракет и торпед.
  include MisseliShip
  include TorpedoShip  
end

class DryCargoShip < Boat
  include CargoShip
  include CraneShip
end

class ConteinerShip < Boat
  include CraneShip
end

class Tanker < Boat
  include CargoShip
end

class MisseliCrauiser < Boat
  include MisseliShip
end

class TransportShip < Boat
  include MisseliShip
  include CargoShip
  include CraneShip
end

# Задание 5:
# *Реализуйте модуль Fivable, включение которого в класс будет разрешать создание только пяти объектов этого класса.
=begin
# Создаем модуль Fivable.
module Fivable
# LIMIT
  LIMIT = 5
# Заводим классовую переменную @@counter в которой будем хранить результаты количества созданных объектов.
# Разделим наш счетчик для классов HelloWorld и класса Wet при помощи Hash.
# Т.к. мы не знаем за ранее классов, сделаем так чтобы хеш мог принимать любые ключи и инициалезировал их со значением 0.

  @@counter = Hash.new(0)

# Вызываем метод super который обеспечит размещение и инициализацию объекта.
  def new
# При создании объектов в методе new мы будем увеличивать значение счетчика на 1
  	@@counter[self] += 1
  	p @@counter
# При создании более 5 объектов сразу гинерируем исключительную ситуацию raise и выведем ошибку.
	raise "Попытка создания лишнего объекта (#{@@counter[self]})." if @@counter[self] > LIMIT
  	super
  end
end
# Создаем класс и подмешиваем в него модуль Fivable
class HelloWorld
# Для подмешивания используем метод extend.Который нам позволит переписать наши классовые методы в частности метод new.
# Таким образом мы сможем контролировать создание объектов при помощи своего собственного метода new.
	extend Fivable 
end
# Что Произойдет если мы подмешаем моуль на уровень другого класса?
# При создании объекта Wet.new так же вывидется исключительная ситуация (raise).Таким образом наш счетчик @@counter стал одним для касса HelloWorld и класса Wet.Разделим его при помощи хеша в методе new.
class Wet
  extend Fivable
end

# Создадим оъекты класса HelloWorld при помощи метода new.
# При помощи массива создаем 5 оъектов данного класса.

arr = Array.new(5) { HelloWorld.new }
#Проверяем что наш счетчит работает правильно для 2 классов.
wet = Array.new(5) { Wet.new }
# После создания 5 объектов Array пытаемся создать 6 HelloWorld и попытка не должна привести к успеху.
p HelloWorld.new
# Задание выполнено. Однако данный пример можно усовершенствовать. extend давольно редко используется, чаще пользователи ожидают модуль можно подключать при помощи include. 
=end

# Разумеется что при подключении модуля Fivable с помощью include программа работать не будет.
# Методы модуля которые подключаються при помощи include становяться инстанс методами, а метод new это классовый метод.
# Мы можем реализовать на уровне модуле Fivable метод include который вызывается при включении модуля внутрь какого-то класса.
# Посмотрим это на примере:
module Fivable
  LIMIT = 5
  @@counter = Hash.new(0)

# Унаследуем своё собственное исключение от RuntimeError
  class TooManyObject < RuntimeError
  	def initialize(counter)
  	  super "Попытка создания лишнего объекта (#{counter})." 
  	end
  end

# base В данном случае будет являться классом Hello либо Some и мы можем использовать его в качестве получателя метода new
  def self.included(base)
    def base.new
      @@counter[self] += 1
      p @@counter
# У нас получается очень длинная строка исключения.Можем реализовать метод raise непосредственно в модуле.
      raise TooManyObject.new(@@counter[self]) if @@counter[self] > LIMIT
      super
    end
  end
end

class Hello
	include Fivable
end

class Some
	include Fivable
end

hello = Array.new(5) { Hello.new }
some = Array.new(5) { Some.new }
p Some.new