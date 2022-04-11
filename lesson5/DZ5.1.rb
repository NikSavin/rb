require_relative 'Dz5'

class Group
	def initialize(*users)#Мы используем сплат оператор(*) для того чтобы показать что параметр users может принимать неограниченное количество объектов.Сам параметр(users) при этом является массивом.
	  @users = users
	end

	def some_each #Для того чтобы обойти список пользователей мы можем реализовать специальный метод some_each 
	  @users.each do |x| 
	  	yield x 
	  end
	end

end
#Т.к. мы передаем в конструктор произвольное количество параметров мы вынуждены реализовать метод initialize
group = Group.new( 
  User.new(name: 'Nik', surname: 'Savin', lastname: 'Vladimirovich'),
  User.new(name: 'Nikita', surname: 'Fedotov', lastname: '!!!'),
  User.new(name: 'Yaroslav', surname: '???', lastname: '!!!')
)

group.some_each { |x| puts x.full_name }