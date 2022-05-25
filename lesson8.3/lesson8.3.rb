# Сегодня мы рассмотрим тесты.
# 1) Типы тестов
# 2) Фреймворки тестирования
# 3) MiniTest

# Тесты можно условно разделить: 
# 1 - Unit тесты => Предназначены для тестирования отдельной функционлальности, например какаго-то метода или утверждения.
# 2 - Конфигурационные => Проверяют функциональность(фичу).Например: Зашли на страницу => Нажели кнопку => Получили результат.
# 3 - Приемочные => Восновном нуны для проджект менеджера аналитика и тимлидов. Они пишутся заранее и фиксируют какой нибудь функционал который должен быть обязательно в конечнй программе.
# 4 - Ручное тестирование => Некоторые задачи очень сложно тестировать автоматически, например верстку сайта, расположение кнопок. Такую работу обычно выполняют вручную, Кроме того, автоматические тесты редко покрывают все возможные случаи. Поэтому ручное тестирование должно вскрывать постоянно возникающие ошибки и оформлять их в виде тест-кейсов которые потом подлежат автоматизации.

# Распределение по количеству тестов будет выглядеть примерно следующим образом:
# Unit тестов должно быть максимально много, они быстро выполняються и позвояют вскрывать низкоуровневые ошибки 
# Интеграционных тестов должно быть меньше чем unit тестов.Они выполняються гораздо дольше по времени и должны покрывать только важный функционал.Здесь уже не нужно писать тесты ради тестов.
# Приемочных тестов должно быть еще меньше и часто эта работа выполняеться вручную.Очень трудно запрограммировать что-то не имея на руках протатип или программу, а приемочные тесты это как раз тот случай когда мы пишем тесты до того как начали работать над самой программой.
# Ручного тестирования должно быть еще меньше.Человек не может заменить машину. Если тестировщик вынужден тестировать программу после каждого коммита, он может не справиться или начнет ошибаться. В идеальных условиях задача тестировщика руководить всем процессом тестирования: Писать тест-кейсы, находить часто возникающие ошибочные ситуации, тестировать те случаи которые трудно поддаються автоматизации.

# Пока мы не используем тесты их преимущества кажутся не очевидными, однако они дают контроль над правильностью выполнения программы.
# Если у нас программа покрыта тестами, то при внисении изменений в код, тесты будут сигналезировать нам о том что изменения ломают какую-то часть функционала.
# Тесты не будут давать сломать то что уже работает правильно.
# Тесты это дополнительный код ревью.Причем этот код ревью не возможно провести формально.
# При помощи тестов доказываеться что код работает правильно,  кроме того тесты отлично вскрывают плохо написанный код или плохо спроектируюмую программу.Если тесты писать сложно, с кодом явно что то не так, это явный сигнал для рефакторинга.

# Разумеется у тестов есть и обратная сторона медали.
# Тесты снижают, но не гарантируют отсутствие ошибок.Высокое покрытие тестами может создать иллюзию того что программа работает правильно.
# Однако полное доказательство при помощи теста того что программа работает правильно, потребует усилий и тестов на порядок больше чем сама программа.
# Тесты это тоже код, они требуют времени на создание и сопровождение.Тесты не так легко писать, прийдеться потратить время, а значит и усилия для того что бы научиться их писать.

# Руби сообщество фанатически относится к тестированию.Более того руби фреймворки часто используются для тестирования программ написанных на других языках.
# Наиболее популярными фреймворками являються: MiniTest, RSpec, Cucumber
# MiniTest - тесты на нем органезованны с помощью классов и методов которые начинаються с префиксa test.
# Minitest входит в стандартную библиотеку руби, поэтому популярен.
# Rspec - альтернативный фреймворк который реалезует DSL язык проектирования(предметно ориентированный язык полностью посвещенный тестированию)
# Cucumber - фреймворк который создан для создания приемочных тестов.Для создания спецификаций на естественном языке, например на русском.Предполагается что такой фреймворк используеться совместно разработчиками и менеджерами или аналитиками для создания приемочных тестов.
# Как разработчики мы чаще всего будем встречаться с minitest и rspec.Это рабочие лошадки в сообществе руби.

# Начнем рассмотрение фреймворков с MiniTest.
# Для того что бы воспользоваться минитестом установим его через bundler. 
# В гемфайле мы подключим гем минитест и установим его при помощи команды bundle.
# Теперь давайте разработаем небольшой класс Hello
require 'minitest/autorun'

class Hello
	def say(str) # В классе будет единственный метод say который возвращает параметр(str) и возвращает фразу например - Hello world если параметр str будет принемать значение Hello world
	end
end
# Для того что бы воспользоваться минитестами их нужно для начала подключить.Сделаем это воспользовавшись методом require
# Для начала тестирования следует создать класс который начинается с префикса Test.
# Класс(TestHello) следует унаследовать от TestCase класса MiniTest
# class TestHello < MiniTest::Unit::TestCase
# В классе мы можем предопределить метод setup который выполняеться до начала всех тестов.
#	def setup
# В методе определим инстанс переменную object которая инециалезируеться объектом класса Hello.  
#		@object = Hello.new
#	end
# Теперь мы готовы писать тесты.
# Тесты это методы которые начинаються с префикса test.Как и все методы они пишутся в снейк режиме.
#	def test_that_hello_return_a_string # Название теста должно обозначать то что мы тестируем.
# Для тестирования мы используем утверждения, специальные методы которые нам предоставляет minitest
# 		assert_instance_of String, @object.say('test') # Здесь мы проверяем что возвращаемое значение метода say это строка.
# Сейчас у нас метод say возвращает значение nil ( def say(str) ). Поэтому тест должен упасть.
#                                                ( end )
#	end
# end
# Запускаем нашу программу на выполнение и видим что тест упал:
# 1) Failure:
# TestHello#test_that_hello_return_a_string [lesson8.3.rb:60]:
# Expected nil to be an instance of String, not NilClass.
# Ожидаеться значение класса string, а полученo nil значение.

# Мы можем поправить нашу программу что бы тест проходил, но сперва закоментируем тест выше.
class Hello1
	def say1(string)
		"Hello #{string}!"
	end
end

class TestHello1 < MiniTest::Unit::TestCase
	def setup
		@obj = Hello1.new
	end

	def test_that_hello1_return_string
		assert_instance_of String, @obj.say1('test')
	end

	def tets_that_hello1_corrent_phrase 
		assert_equal 'orld!', @obj.say1('world') 
	end

end
# Запускаем программу и видим что тесты прошли:
# MiniTest::Unit::TestCase is now Minitest::Test. From lesson8.3.rb:78:in `<main>'
# Run options: --seed 1322
# Running:
# .
# Finished in 0.000978s, 1022.4949 runs/s, 1022.4949 assertions/s.
# 1 runs, 1 assertions, 0 failures, 0 errors, 0 skips
# Вместо сообщения об ошибке у нас одна точка. Это значит что наш тест прошел успешно!

# Если мы обратимся к документации minitest то мы можем обнаружить большое количество самых разнообразных утверждений.
# Давайте ознакомимся с assert_equal это самое простое утверждение которое сравнивает равенство одного аргумента с другим.
# Напишем еще один тест с использованием этого утверждения.
# Сейчас у нас в классе TestHello1 только один тест который прверяет что метод say возвращает строку.
# Давайте проверим что эта строка начинаеться именно с Hello.
# Добавим в наш класс TestHello1 тест - tets_that_hello1_corrent_phrase
# В тесте мы хотим убедиться что вызов @obj.say1 с передачей ему аргумента в качестве строки world вернет Hello world.
# 
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#