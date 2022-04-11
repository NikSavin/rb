class Fabric
 attr_reader :type

 @@types = []
 @@counters = {}
 @@total = 0

  def initialize(type)
 	raise 'Такой тип игрушки отсутствует.' unless @@types.include? type
 	@type = type
 	@@counters[type] += 1
  @@total += 1
  end

  def counter
   @@counters[type]
  end

  def total
    @@total
  end

 class << self
   def add_type(type)
 	  return if @@types.include? type
 	  @@types << type
 	  @@counters[type] = 0
   end

   def types
     @@types
   end
 end
end