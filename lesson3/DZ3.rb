#require /.user/


lastname = %w[Иванов Петров Сидоров Алексеева Казанцев Антропов Анисимова Кузнецов Соловьев Кошкина]
puts lastname.sort!
#arr = [38,59,79,20,32,49,36,70,22,46]
arr = Array.new(10){ rand(100) }
puts arr.sort!.first
puts arr.sort!.last

