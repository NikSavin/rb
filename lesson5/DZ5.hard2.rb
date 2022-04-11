require_relative 'Fabric'




#add_type добавляет тип игрушки 
Fabric.add_type 'bear cub'
Fabric.add_type 'bear cub'
Fabric.add_type 'ball'
Fabric.add_type 'cube'

p Fabric.types


cub = Fabric.new('cube')
cub1 = Fabric.new('cube')
cub2 = Fabric.new('cube')

p cub2.type
p cub2.counter

ball1 = Fabric.new('ball')
ball2 = Fabric.new('ball')

p ball2.type
p ball2.counter

bear = Fabric.new('bear cub')

p bear.type
p bear.counter

p bear.total

__END__
class Fabric
@@types = [] #Мы будем сохранять типы в классовой переменной types которая будет содержать масив наших типов.

def self.add_type(type)
  @@types << type unless @@types.include? type #При добавлении типа мы проверяем входит ли данный тип игрушки в массив types и если не входит добавляем, если он уже зарегестрирован то ничего не делаем.
end

def self.types #При помощи метода types мы выводим результат.
  @@types
end

end