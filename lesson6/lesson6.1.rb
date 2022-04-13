#До этого мы не переопределяли методы, а лишь использовали готовые методы базового класса.Давайте посмотрим на ситуацию когда нам нужно изменить метод который писутствует в базовом классе!
class Page

  attr_accessor :title, :body, :headers
#метод initialize будет принимать 3 параметра: title:, body:, headers: [] и присваивать их одноименным инстанс переменным.
  def initialize(title:, body:, headers: [])
    @title = title
    @body = body
    @headers = headers
  end
end

#Класс News у нас содержит ещё одну инстанс переменную date.Модифицируем метод initalize таким образом чтобы date автоматически присваивалась текущая дата.
class News < Page

  attr_accessor :date
#Если мы сейчас попробуем воспользоваться методом initialize класса News то инстанс переменные title:, body:, headers [] останутся не инициализируемыми.
#Чтобы убедится этому на практике нужно создать объект класса News.
  def initialize(title:, body:, date:, headers: [])
    @date = date
    #@date = Time.new
#Для того чтобы воспользоваться методом initialize базового класса Page мы можем воспользоваться методом super
#super автоматически вызывает одноименный метод базового класса и передает ему все параметры текущего метода.
    #super
#Если количество параметров базового(Page) и произвольного(News) класса не совпадают, мы можем указать список параметров методу super явно!
#Чтобы не сломать нашу программу мы должны добавить явно наш параметр date: методу super
    super(title: title, body: body, headers: headers)
  end
end

#После подключения метода super #<News:0x00007ff3ab9c2178 @date=2022-04-09 16:24:10 +0300, @title="New", @body="Lorum ipsum", @headers=[]>
#До подключения метода super <News:0x00007f95dd822420 @date=2022-04-09 16:17:28 +0300> 
#После добавления параметра date: в метод initialize  нам нужно явно передать его в новый объект.
#news = News.new(title: 'New', body: 'Lorum ipsum', date: Time.now)
#p news

sup = News.new(title: 'new', body: 'lorum ipsum', date: Time.now)
p sup







__END__
class Page
  attr_accessor :title, :body, :header
end

class News < Page# Символ наследования обозначается знаком <, БАЗОВЫЙ КЛАСС МОЖЕТ БЫТЬ ТОЛЬКО ОДИН!!!Теперь геттеры и сеттеры(:title, :body, :headers) доступны классу News
	#Мы можем расширить возможности класса News по сравнению с классом Page.Добавим какое-то свойство которое уникально для новостей, например добавим дату публикации.
  attr_accessor :date
end

class About < Page
  attr_accessor :phone, :address

end

class PhotoCatalog < Page
	attr_accessor :photo
end

about = About.new

about.title = 'О нас'
about.body = 'Мы находимся по адресу'
about.phone = ['+7 920 4567722','+7 920 4567733']

p about

page = Page.new

page.title = 'Главна страница'
page.body = 'Тело главной страницы'
#page.phone = ['+7 920 3645512', '+7 911 3883939'] #присваивание классу неизвестного сеттера phone приведет к ошибке.

p About.ancestors#Показывает полный путь класса вплоть до BasicObject
