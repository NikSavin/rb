require 'rubygems'
require 'bundler/setup'

Bundler.require(:default)
# План урока:
# 1) Продвинутые возможности bundler
# 2) Исследование содержимого гемов
# 3) Подключение гемов к проекту
# 4) Окружение
# 5) Создание собственных гемов

# Как мы уже знаем bundler не только автоматически устанавливает гемы но и загружает все зависимости.Ознакомиться с зависимостями можно в файле Gemfile.lock который генерируеться автоматически при запуске установки гемов.
# Bundler позволяет нарисовать графическую схему зависимостей гемов. Попробуем это сделать bundle viz.
# Как видим в консоли у нас выводиться ошибка:
# #<Gem::MissingSpecError: Gem::MissingSpecError>
# Make sure you have the graphviz ruby gem. You can install it with:
# `gem install ruby-graphviz`
# Выводиться подсказка что данная команда зависит от гема ruby-graphviz.Установим его.

# Bundle позволяет выяснить где у нас установленны гемы.Для этого надо воспользоваться командой ( bundle show название_гема ) 
# Можно сразу открыть гем с помощью команды bundle open name_game
# Но при использовании впервые команды open может возникнуть ошибка.Что бы ее устарнить нужно установить в программной оболочке окружение BUNDLER_EDITOR.
# Обычно его устанавливают в bash_profile в домашней директории.
# cat ~/.bash_profile | grep BUNDLER_EDITOR export BUNDLER_EDITOR=subl
# НАДО РАЗОБРАТЬ КАК ЭТО СДЕЛАТЬ =)

# Получить более подробную информацию можно получить при помощи команды bundle info имя_гема
# bundle info rspec
#  * rspec (3.7.0)
#	Summary: rspec-3.7.0
#	Homepage: http://github.com/rspec
#	Path: /Users/test123/Git_add/ззп/vendor/bundle/ruby/2.4.0/gems/rspec-3.7.0

# До текушего ролика мы подключали методы при помощи require при использовании bundler в этом нет необходимости.
# Все гемы которые мы объявляем в Gemfile мы можем подключить при помощи одной инструкции Bundler.require(:default) после того как мы подключили сам гем bundler
# require 'rubygems' // Первые две строчки нужны для подключения гема bundler
# require 'bundler/setup' 
# Bundler.require(:default) // В третьей мы уже подключаем гемы из Gemfile

# Если в подключении гема нет необходимости, его можно отключить.
# Для этого при вызове метода gem в Gemfile нужно подключить параметр require: false
# Это приведет к тому что Bundler будет игнорировать данный гем.
# gem 'rspec', '~>3.7.0', require: false
# В фале не будет происходить подключение такого гема.

# Управлять гемами можно и при помощи окружений.
# Для этого в Gemfile можно вызвать метод group.
# group принемает блок в котором можно перечислить гемы которые должны быть установленны только для данного окружения.
# Например мы можем потребовать что бы тестовый гем rspec устанавливался только в development окружении, только в режиме разработке только на локальной машине.
# group :development do 
# 	gem 'rspec', '~> 3.7.0'
# end
# Таким образом при загрузке приложения на сервере не будут тратиться ресурсы для загрузки и размещения гема.

# Методу group можно передать несколько окружений через запятую (,).
# Например мы можем потребовать что бы гем устанавливался для development и test окружений.
# group :development, :test do
# 	gem 'rspec', '~>3.7.0'
# end

# Можно избежать установки гемов из определенной группы при помощи параметрa without.
# bundle install --without test

# Можно наобарот установить гемы единственной группы при помощи параметра with.
# bundle install --with development

# Мы можем разработать свой собственный гем.
# Для этого необходимо воспользоваться командой bundle gem имя_гема(в качестве параметра принемаеться имя гема)
# Для наглядности создадим гем в директории папки нашего урока. 
# bundle gem somegem
# после этого можно видеть небольшой отчет в котором перечисляються все файлы созданные в текушей папке.
# Creating gem 'somegem'...
# Initializing git repo in /Users/test123/Git_add/ззп/somegem
#      create  somegem/Gemfile
#      create  somegem/lib/somegem.rb
#      create  somegem/lib/somegem/version.rb
#      create  somegem/sig/somegem.rbs
#      create  somegem/somegem.gemspec
#      create  somegem/Rakefile
#      create  somegem/README.md
#      create  somegem/bin/console
#      create  somegem/bin/setup
#      create  somegem/.gitignore
# Gem 'somegem' was successfully created. For more information on making a RubyGem visit https://bundler.io/guides/creating_gem.html
# Теперь можно перейти в редактор и исследовать структуру гема.
# У нас появилась новая папка somegem.В ней представлена типичная структура гема:
# в папке bin можно размещать команды которые после запуска гема будут доступны в командной строке
# папка lib содержит основной код гема
# У МЕНЯ НЕ ПОЯВИЛАСЬ ПАПКА spec которая предназначается для тестов гема
# гем имеет собственный Gemfile
# Наверное самым главным файлом являеться файл с расширением .gemspec (somegem.gemspec)
# В файле с расширением .gemspec перечисляються параметры гема.
# Мы можем заполнить их для публикации на rubygems.org если мы захотим сделать наш гем достоянием общественности.
# В начале гема подключаються все файлы которые находяться в папке lib.
# Точкой входа служит файл somegem.rb:
# require_relative "somegem/version"
# В настоящий момент он подключает только файл version.rb
# Создадим какой нибудь дополнительный файл в директории /lib/somegem с расширением .rb например hello.rb
# Здесь начинает действовать соглашение про которое мы говорили в передыдущих роликах.
# Мы находимся в отдельной папке somegem следовательно код требуеться разместить в модуле SomeGem:
#  module SomeGem
#  end
# Внутри мы расмещаем класс Hello, который совпадает по названию с именем файла.
# module SomeGem
# 	class Hello
# 	end
# end
# В классе определим например единственный классовый метод say.Его предназначение будет просто вывод параметра(str) в стандартный поток вывода.
# module SomeGem
# 	class Hello
# 		def self.say(str)
# 			puts str
# 		end
# 	end
# end
# Теперь нам необходимо подключить класс Hello в файле somegem.rb
# require "somegem/hello"
# Наш гем готов.Можем им воспользоваться.

# Гемы не обязательно публиковать на rubygems.org .Мы можем указать путь до гема в файловой системе при помощи специального параметра path: .
# Подключаем гем somegem в Gemfile и указываем относительный путь до его папки.
# До того момента пока мы не выполним команду bundle install у нас не обновится содержимое Gemfile.lock и наша программа не сможет воспользоваться новым гемом.
# Поэтому перейдем в консоль и выполним команду bundle install или просто bundle.(ПЕРЕД ЭТИМ ПРИШЛОСЬ ЗАКОМЕНТИРОВАТЬ НЕКОТОРЫЕ СТРОКИ В somegem.gemspec)
# bundle install
# Fetching gem metadata from https://rubygems.org/.
# Resolving dependencies...
# Using rake 13.0.6
# Using bundler 2.3.13
# ing diff-lcs 1.5.0
# Using rspec-support 3.7.1
# Using somegem 0.1.0 from source at `somegem` // Вот здесь как раз и показано что наш гем подключился.
# Using rspec-core 3.7.1
# Using rspec-expectations 3.7.0
# ing rspec-mocks 3.7.0
# Using rspec 3.7.0
# Bundle complete! 3 Gemfile dependencies, 9 gems now installed.
# Bundled gems are installed into `./vendor/bundle`
# Если мы посмотрим в Gemfile.lock то можем увидить новую секцию PATH куда помещен гем somegem.
# Воспользуемся гемом somegem в нашей программе.Подключать гем не нужно так как он уже подключен в нашем файле при помощи Bundler.require(:default) 
# Поэтому мы можем сразу использовать метод say из гема:
SomeGem::Hello.say('Привет из гема SomeGem!')