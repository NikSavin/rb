# Текущий урок полностью посвещен гему rack.
# Этот гем являеться краеугольным  для постраения приложений на языке руби.Все сервера и все фреймворки используют его как связующее звено.
# План урока:
# 1) Гем Rack
# 2) Утилита rackup
# 3) Создание rack-приложений
# 4) Middleware


# Для начала установим гем, воспользуемся для этого утилитой gem.(gem install rack -v 2.0.4) 
# Гем rack предоставляет утилиту rackup которая позваляет запускать наш веб сервер.
# Если мы запускаем утилиту rackup без параметров, она будет искать файл confin.ru в котором будет искать rack-приложение.
# Давайте сздадим такой файл.
# Для того что бы воспользоваться этой библиотекой нам необходимо подключить ее при помощи метода require.
# Rack требует от преложений что бы они поддерживали метод call принемающий единственный параметр.Через этот параметр передаются различные переменные окружения, информация от клиента и HTTP-заголовки. 
# Давайте реалезуем приложение на базе класса App.
# 
# class App # Создаем наш класс App 
#   def self.call(env) # Реализуем классовый метод call.
# В качестве ответа метод должен возвращать массив с тремя элиментами:
# 1) HTTP-код состояния.
# 2) Хеш с HTTP-заголовками ответа.
# 3) Массив с содержимым ответа.
#     [200, {'Content-Type' => 'text/html'}, ['Hello World!'] ]
#   end
# end
# run App
#
# Посмотрим на содержание нашего массива в методе call:
# 1) Мы отправляем код состояния 200
# 2) Вторым элиментом нашего массива мы указываем хеш который содержит ключь => значение. Ключем выступает название HTTP-заголовка, значением его содержимое.В данном слчае мы отправляем всего один Http-заголовок: Content-Type.
#    Мы хотим сообщить браузеру что мы отправляем html-код.На самом деле мы шлем текстовую строку 'Hello World!' без каких либо html тегов.Поэтому в принципе мы могли бы заменить html на plain.
# 3) Передаем строку 'Hello World!' в наш барузер.
# 
# Что бы запустить rack-приложение воспользуемся методом run.(run App)
# Давайте запустим наше приложение и убедимся что в браузере мы увидим фразу Hello World!
#
# Переходим в консоль и запускаем утилиту rackup.Утилита сообщает нам некоторую справочную информацию:
# MacBook-Pro-test123:lesson8.4 test123$ rackup # Запускаем наше приложение.
# [2022-06-02 17:25:23] INFO  WEBrick 1.3.1 # Сообщает нам о том что был запущен сервер WebBrick 
# [2022-06-02 17:25:23] INFO  ruby 2.4.2 (2017-09-14) [x86_64-darwin16] # Показывает версию руби.
# [2022-06-02 17:25:23] INFO  WEBrick::HTTPServer#start: pid=22421 port=9292 # Показывает на каком порту был запущен сервер, в нашем случае это 9292
# Остановить сервер можно с помощью комбинаций ctrl+c
# 
# Прежде чем мы пойдем дальше, давайте остановимся на понятии port.
# В сети каждый host имеет свой ip адрес по которому один компьютер может отличаться от другого.
# Однако на этом компьютере(хосте) может работать несколько серверов.Что бы их отличать друг от друга используеться специальный номер, который называеться port.
# Некоторые порты стандартезированны.Например 80 порт обычно используеться для HTTP-сервера, а 22 для SSH-сервера.
# Порты до 1024 считаються привелигированными.На них не всегда можно запустить сервер если на это нет прав доступа.Поэтому для разработки очень популярны порты выше 1024.
# Именно поэтому rakcup использует порт 9292.
# 
# Давайте обратимся в браузере к этому порту и убедимся что сервер возвращает нам ответ.
# В адресной строке мы пишем localhost:9292.
# localhost это сенонем для ip адреса 127.0.0.1 .Этот ip адресс зарезервирован за локальной машиной.
# Т.е. все запросы которые мы отсылаем на его адрес 127.0.0.1 или на его алиас(псевдоним) localhost отправляються на текущую машину.
# 
# Как мы видим в браузере мы получили фразу 'Hello World!' которую мы собственно и отправляли из Руби прилжения.
# Если мы сейчас перейдем в панель разработчика и откроем вкладку сеть, то обнаружим наш запрос.
# В НТТР-ответах мы можем увидеть Content-Type: text/plain , точно такой же который мы указывали в нашей программе.
# В информационном заголовке сервер указываеться: Server: WEBrick/1.3.1 (Ruby/2.4.2/2017-09-14)
# 
# Давайте снова перейдем в текстовый редактор и поправим наш Content-Type с text/plain на text/html и строку 'Hello World!' на строку 'Hello Ruby!'
# class App
#	def self.call(env)
#	  [200, {'Content-Type' => 'text/html' }, ['Hello Ruby!']]
#	end
# end
# Для того что бы изменения вступили в силу нам потребуется остановить сервер с помощью CTRL+C и запустить его снова(rackup)
# Останавливаем сервер и видим что в консоли сервера выводится каждый запрос.Мы перезагружаем страницу и на каждую перезагрузку выводится отчет.Во сколько было обращение и к какой странице.
# ::1 - - [02/Jun/2022:17:51:42 +0300] "GET / HTTP/1.1" 200 - 0.0028
# ::1 - - [02/Jun/2022:17:51:47 +0300] "GET /favicon.ico HTTP/1.1" 200 - 0.0006
# ::1 - - [03/Jun/2022:15:34:16 +0300] "GET / HTTP/1.1" 200 - 0.0037
# ::1 - - [03/Jun/2022:15:34:16 +0300] "GET /favicon.ico HTTP/1.1" 200 - 0.0009
# ^C[2022-06-03 15:46:12] INFO  going to shutdown ...
# [2022-06-03 15:46:12] INFO  WEBrick::HTTPServer#start done.
# Запускаем снова сервер:
# MacBook-Pro-test123:lesson8.4 test123$ rackup
# [2022-06-03 15:52:38] INFO  WEBrick 1.3.1
# [2022-06-03 15:52:38] INFO  ruby 2.4.2 (2017-09-14) [x86_64-darwin16]
# [2022-06-03 15:52:38] INFO  WEBrick::HTTPServer#start: pid=22584 port=9292
# Мы перезагрузили сервер и теперь можно отправиться в браузер и убедиться что наша страница теперь отправляет новый HTTP-заголовок и новое содержимое 'Hello Ruby!'
# Перезагружаем страницу и видим что 'Hello World!' заменился на  'Hello Ruby!', а тип страницы стал html.
# Давайте посмотрим НТТР-заголовки и убедимся что Content-Type теперь стал text/html.
# 
# При запуске утелиты rackup мы можем явно указывать название конфигурационного файла(rackup config.ru).Поэтому если мы решим разместить наше rack-приложение в другом файле, можно просто указать название файла в первом параметре при запуске утилиты rackup.
# 
# Можно указать другой порт.Если текущий порт занят или не удобен нам в текущий момент времени, мы можем указать другой порт при помощи параметра -р.Давайте запустим порт 8080.
# 
# Сейчас какой бы запрос мы не слали, у нас сервер отправляет один и тот же ответ. Мы обращаемся к главной странице сайта, у нас Hello Ruby! . 
# Если мы сейчас обратимся к адресу hello, мы получим точно такой же ответ.
# Давайте научим наш сервер отвечать кодом состояния 404 на страницы которые отличаются от главной.
# По умолчанию у нас статус 200, а сообщение 'Hello Ruby!' но если у нас путь PATH_INFO не совпадает с главной страницей, мы меняем статус на 404, а тело ответа на 'Not found'
# class App
#	def self.call(env)
#	#  [200, { 'Content-Type' => 'text/plain' }, ['Hello World!']]
#	#  [200, {'Content-Type' => 'text/html' }, ['Hello Ruby!']]
#		header = { 'Content-Type' => 'text/html' }
#		status = 200 # Значение по умолчанию.
#		body = 'Hello Ruby!' # Фраза по умолчанию.
#		unless env['PATH_INFO'] == '/' 
#			status = 404
#			body = 'Not found'
#		end
#		[status, header, [body]] # Формируем массив из трех элементов который требуется для всех rack-приложений.
#	end
# end
# Перезагружаем сервер и браузер.Переходим на localhost:8080.Получаем код состояния 200.
# Меняем localhost:8080 на localhost:8080/hello и получаем ошибку 404.
# 
# ДАвайте усовершенствуем наше приложение.Научим его отправлять HTTP-заголовок Content-Length в котором мы будем отправлять размер содержимого HTTP-документа.
# В случае небольших html страниц это не кретично, но если мы предоставляем браузеру объемный файл он не сможет соорентировать пользователя когда же будет завершена загрузка страницы, если мы не сообщим размер файла в HTTP-заголовке Content-Length
# Добавляем в хеш header еще один ключ Content-Length.Значение этого ключа мы вычисляем по размеру строки body(body.length) причем преобразуем этот размер к строковому значению при помощи to_s(body.length.to_s).
# to_s мы используем по тому что rack будет ожидать именно строку.
# Перезапускаем наш сервер и браузер и видим что в заголовках появился новый ответ Content-Length.Он равен 9.
# Если мы перейдем на вкладку ответ, мы сможем обнаружить что в качестве ответа отправляеться строка Not found которая как раз равна 9 символам.
# 
# Метод run довольно интелектуальный, он может принимать не только объект который отзывается на метод call, но и обычный прок-объект.
# run proc{ |env| [ {'Content-Type' => 'text/plain'}, ['Hello Ruby!']] }
# Выше представлено наверное минимальное rack-приложение.
# Вместо proc-объекта можно так же использовать lambda, такой rack-объект работает точно так же.
# run -> (env) do
#	[200, {'Content-Type' => 'text/html'}, ['Hello Ruby!']]
# end
# Расширять приложение можно при помощи middleware. Это специальные слои которые мы можем подключить к приложению, выстраивая цепочки вызовов.
# Middleware тоже удобно использовать в виде классов.Они так же должны реализовывать метод call.
# class MyMiddleWare
#	def initialize(app) # Методу initialize передается объект rack-приложения которое мы сохраняем в инстанс переменной.
# Эту инстанс переменную мы будем использовать в методе call
#	  @app = app
#	end
#
# 	def call(env)
# 	  @app.call(env)
# 	end
# end
# Давайте теперь научим наш middleware делать что то полезное.Например возвращать 404 если идет обращение к любой странице кроме главной.
# class MyMiddleWare
#	def initialize(app)
#		@app = app
#	end
#
#	def call(env)
#		unless env['PATH_INFO'] == '/'
#			return [400, { 'Content-tupe' => 'text/html'}, ['Not Found.']]
#		end
#		@app.call(env)
#	end
# end
# Для того что бы воспользоваться новым классом MyMiddleWare нам надо передать его методу use.
# use MyMiddleWare
# Наше приложение готово, давайте запустим его.Перезапускаем приложение на порту 8080.
# И убеждаемся что при обращении к адресу localhost:8080 получаем Hello Ruby, а при обращении к другому адреу получаем Not Found.
# 
# Гем rack предоставляет метод map при помощи которого мы можем назначать обработчики различным роутам.
# Мы можем передать методу map какой либо роут, а в блоке передать обработчик.
# Гем Rack содержит в примерах небольшое приложение пасхалку, которое при помощи псевдо графики ресует в браузере изображение лобстера.
# Давайте подключим это приложение и запустим его по адресу lobster
# require 'rack/lobster' # Подключаем приложение.
# map '/lobster' do # Запускаем приложение '/lobster' в обработчике map.
#   run Rack::Lobster.new
# end
# Запускаем наше приложение по адресу localhost:8080/lobster и видим изображение лобстера.Если мы нажмем на кнопочку flip он перевернеться, при повторном нажатии он займет изначальное положение.
# 
# Давайте научим наше приложение отдавать статические файлы.
# Обратим внимание на нашу структуру нашего приложения.В текущей папке находится папка static.
# Внутри папки мы можем обнаружить файл ruby.jpg с логотипом языка руби.
# Добьемся того что бы этот файл отдавался нашим серверам.
# Для этого при помощи метода map мы создадим новый роут static&
# map '/static' do
#  run Rack::File.new 'static' # внутри этого роута мы можем запустить Rack-приложение Rack::File.new передав ему в качестве параметра папку static.
# end
# Давайте перезапустим наш сервер и проследуем в браузер.
# Если мы обратимся к адресу localhost:8080/static/ruby.jpg то мы увидим нашу картинку.
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