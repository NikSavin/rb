class Hello
	def say
		'Привет!'
	end
end

Допустим /^дан объект класса$/ do
	@hello = Hello.new
end

Если ('я вызываю его метод say') do
	@msg = @hello.say
end

То ('я получаю строку {string}') do |string|	# /^я получаю строку '([^']*)'$/ do |str| - запись с помощью регулярных выражений.
	@msg == string
end