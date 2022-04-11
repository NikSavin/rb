require_relative 'user'

Не отображает в консоли массив  lastname!Не подтягивает фамилии в make_users!

#puts lastname.sort!
#arr = [38,59,79,20,32,49,36,70,22,46]
#arr = Array.new(10) { rand(100) }

#puts "Минимальное значение #{arr.min}"
#puts "Максимальное значение #{arr.max}"

def make_users(name, mark)
	user = User.new
	user = name
	user = mark
	user
end

lastname = %w[Иванов Петров Сидоров Алексеева Казанцев Антропов Анисимова Кузнецов Соловьев Кошкина]

=begin
group = []

group << make_users(lastname[0], rand(5) + 1)
group << make_users(lastname[1], rand(5) + 1)
group << make_users(lastname[2], rand(5) + 1)
group << make_users(lastname[3], rand(5) + 1)
group << make_users(lastname[4], rand(5) + 1)
group << make_users(lastname[5], rand(5) + 1)
group << make_users(lastname[6], rand(5) + 1)
group << make_users(lastname[7], rand(5) + 1)
group << make_users(lastname[8], rand(5) + 1)
group << make_users(lastname[9], rand(5) + 1)

p group
=end
group = 10.times.map { |i| make_users(lastname[i], rand(5) + 1) }

p group
#p group.max_by { |x|  x.mark }