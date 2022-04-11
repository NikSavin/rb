class HelloWorld
  define_method :cube do |my_arg| #
  	my_arg ** 3
  end
end

#class HelloWorld
  #def cube(my_arg)
  #  my_arg ** 3
  #end
#end

hello = HelloWorld.new
puts hello.cube(2)