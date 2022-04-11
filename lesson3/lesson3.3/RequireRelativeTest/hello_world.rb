
module RequireRelativeTest#Так как нам не надо создавать объект класса RequireRelativeTest мы можем превратить его в modul.Modul это теже классы только у него отсутствует возможность создания объектов.Поэтому если нам объект не нужен в таких вложеных структурах смело можно использовать модули.
#class RequireRelativeTest #Когда мы размещаем класс в одноименной папке, его принято вкладывать в одноименный класс (HelloWorld)=>(RequireRelativeTest)
  class HelloWorld#Имя файла(hello_world.rb) должно иметь название класса(HelloWorld)
  	  MESSAGE = 'hi,world'#Константы хорошо ведны в коде, меньше соблазна их заменить, они быстрее работают чем классовые переменные @@
  	def say
  	  MESSAGE #
  	  #'hi, world'
  	end
  end
end