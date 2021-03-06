# В данном уроке мы рассмотрим теорию сетевого взаимодействия.
# 1) Клиен-серверное взаимодействие
# 2) Основы протакола HTTP
# 3) Ruby-серверы
# 4) Гем rack

# 1) Клиент-серверное взаимодействование:
#
# 	|---------|  HTTP-запрос   |---------|
# 	|  Web    | <============= |  Web    |
# 	|  сервер |  HTTP-ответ    | браузер |
# 	|---------| =============> |---------|
#
# Протокол HTTP используется для доставки страниц и сопутствующих документов от сервера к браузеру.
# Когда мы посещаем сайт и переходим по ссылкам, мы фактически каждый раз посылаем HTTP запрос серверу.Он посылает нам HTML страницу которая состоит из структуры, текста, ссылок на изображение, аудио и видео файлов.
# Что бы браузер мог отрисовать эту страницу он должен иметь возможность загрузить с сервера основную страницу и все сопутствующие документы.Для обслуживания таких протоколов и предназначен запрос HTTP.
# Т.к. у нас с одной стороны находится клиент(web браузер), а с другой сервер(web сервер) протокол называют: Клиент-серверным.
# Клиенты шлют HTTP запросы что бы получить какой либо ресурс.
# Веб сервер обрабатывает HTTP-запрос и отправляет в виде HTTP-ответа.

# 2) Основы протакола HTTP:
# 
# |--------------------|
# |	|----------------| |
# |	| HTTP-заголовки | |
# |	|----------------| |
# |                    |
# |	|----------------| |
# |	|                | |
# |	|      Тело      | |
# |	|                | |
# |	|----------------| |
# |--------------------|
# 
# Клиен и сервер обмениваются между собой HTTP документами.
# HTTP документ деляться на две части:
# 1) HTTP-заголовки 
# 2) Тело 
# НТТР-заголовки содержать различную мета информацию 
# В теле HTTP документа передаеться полезная нагрузка например HTML страница или изображение.
# 
# Далее для наглядности мы можем перейти на какой небудь реальный сайт и в браузере GoogleChrome открыть инструмент разработчика.
# Перейдем на вкладку сеть.Здесь мы можем видеть HTTP запросы которые были отправленны сервером.
# На первой вкладке ЗАГОЛОВКИ мы можем видеть:
# - Заголовки ответа которые были получены от сервера.
# - Заголовки которые были отправлены клиентом, серверу.
# Кроме того мы можем посмотреть сам ответ на вкладке ОТВЕТ.Как видно в качестве ответа нам была прислана HTML страница.
# Можно использовать панель инструментов для исследования запросов и ответов любого веб сервера.
# 
# Как мы видели заголовков очень много.Как со стороны клиента так и со стороны сервера.
# Ниже представлены несколько HTTP заголовков которые характерны для HTTP-запросов и HTTP-ответов.
# HTTP-запрос:
# 1) GET/path HTTP/1.1
# 2) Host: доменное_имя_сайта
# 3) Acept: text/html
#
# 1) При запросе HTTP всегда отправляет метод при помощи которого осуществляеться запрос.В данном случае это метод GET.
# После него следует путь от корня сайта, к какой странице мы обращаемся в данном случае это path
# Далее следует версия протакола 1.1 .ДАнная версия практически не используется в настоящий момент.
# HTTP протокол поддерживает несколько разных методов.Здесь у нас указан только GET.Его характерной чертой является тот факт что в get запросах отправляеться только HTTP-заголовки, тело HTTP документа пустое.Если клиент хочет отправить какой-то файл то для этого будет скорее всего использован метод POST.
# 2) Каждый клиен обязательно отправляеть HTTP заголовок => Host в котором передаеться доменное имя сайта.
# Если сервер обслуживает несколько сайтов, по этому HTTP заголовку он будет определять какому из сайтов адрессован запрос.
# 3) Заголовков очень много и все мы их рассмотреть не сможем.Тем более многие из них носят вспомогательный характер.
# Например Acept сообщает что клиент ожидает получить информацию в каком-то определенном формате, например в нашем случае это html.
# Если у сервера есть несколько вариантов ответа на данный запрос, он выдаст наиболе подходящий, если вариантов нет он выдаст то что есть.
# 
# HTTP-ответы:
# 1) HTTP/1.1 200 Ok
# 2) Content-Type: text/html
# 3) Server: nginx
# 
# 1) Сервер в ответ на HTTP-запрос шлёт типичные HTTP заголовки.Первый заголовок сообщает о состоянии.Он тоже начинаеться с версии протакола HTTP/1.1 .
# Далее следует код состояния, в данном примере это 200(успешная обработка запроса).
# 2) HTTP заголовок Content-Type обозначает о формате присланного документа.В данном случае это тоже html
# 3) Заголовок Server являеться не обязательным и информационным.Он обозначает сервер который обслуживает запрос.

# HTTP-кодов состояния таких как 200 очень много.Они обязательно являются трехзначными и начинаються с одной из цифр:
# 1хх - информационные коды, сервер в процессе обработки запроса.Например сервер с помощью такого кода может сообщить что он все еще обрабатывает запрос.
# 2хх - коды успешного выполнения запроса
# 3хх - коды переадресации
# 4хх - коды ошибочного запроса со стороны клиента. Например страницы может просто не быть и в этом случае мы получим код 404 или нам может быть закрыт к ней доступ в таком случае мы получим код 403.
# 5хх - коды ошибок на стороне сервера.

# 3) Ruby-серверы:
# Для того что бы написать сайт нам не нужно разрабатывать свой собственный сервер и реализовывать протокол HTTP.Имееться уже очень много готовых серверов. Более того эти сервера мы будем встраивать в свое собственное приложение зачастую в виде гема.
#
# Самый простой сервер WebBrick встроен в руби.Мы можем использовать его не устанавливая никаких дополнительных бибилиотек.
# Сервер предназначен только для локальной разработки, он однопоточный и не может обслуживать множество клиентов сразу.
# 
# Другой сервер это Thin.Это тоже однопоточный сервер но он реалезует механизм event loop, т.е. один поток бегает по кругу и опрашивает все соединения.
# Если ответ получен он начинает его обработку, если ответ не получен он переключается на следующее соединение.Таким образом один поток может быстро и эффективно обрабатывать множество клиентов.
# У Thin есть недостаток.Он боится замедления со стороны приложения.Если наше приложение задумается, сервер не сможет бежать дальше и обслуживать запросы.
# 
# В продакшен окружении мы будем чаще всего видеть puma или unicorn.
# 
# Unicorn это классический fork server.Для обслуживания множества клиентов в нем создаются несколько воркеров сервера которые располагаются в отдельных процессах.
# Операционная система сама умеет выполнять разные процессы параллельно.Поэтому проблема обслуживания нескольких клиентов здесь не стоит.
# Однако Unicorn боиться медленных клиентов. Т.к. мы имеем дело с отдельными процессами, unicorn потребляет довольно много оперативной памяти.Из ограниченой памяти мы можем загрузить воркеров только ограниченное количество.
# Если к воркерам подсоедениться множество клиентов с медленными каналами и связями они могут занять все воркеры иих может не остаться для обслуживания других клиентов.
# Поэтому Unicorn довольно часто используеться в связке с другим сервером, например Nginx который обслуживает статику.
# Т.е. Unicorn обслуживает только руби код, а nginx обслуживает картинки, CSS, JS файлы. 
# 
# Сервер Puma являеться комбинацией подходов принятых в Unicorn и Thin.Внутри него есть event loop, а так же есть возможность запускать несколько воркеров.Поэтому на настоящий момент puma это наиболее часто используемый сервер который используеться в продакшен окружении.


# 4) Rack  
#                                        |-----------------|
#                                        | Ruby-приложение |
#                                        |-----------------|
#  |--------|                               /\  /\
#  | Клиент |                               ||  ||
#  |--------|                            |----------|
#   || /\                                |   rack   |
#   || ||                                |----------|
#   || ||                                   /\  /\
#   \/ ||                                   ||  ||
# |---------|        |----------|        |-------------|
# | браузер | =====> | интернет | =====> | НТТР-сервер |
# |---------|        |----------|        |-------------|
# 
# Запросы которые отправляются клиентом через браузер попадают через сеть интернет в HTTP-сервер.
# Далее наш HTTP-сервер должен обратиться к Ruby-приложению.Серверов довольно много, руби приложения так же разрабатываються на разных фреймфорках.Для того что бы связать HTTP-сервера и Ruby-приложения как раз и предназначен гем Rack. 
# Rack выступает в качестве единого интерфейса для взаимодействия ruby-приложения и HTTP-серверов.Все современные фреймворки взаимодействуют с серверами через rack.
# 
# Слева представлены различные варианты создания веб приложений на руби.Это может быть чистое приложение на rack или можно использовать какой нибудь руби фреймворк например RoR, Sinatra или Hanami.
# Справа у нас находяться сервера: Puma, Unicorn, Thin, WebBrick.
# И сервера и фреймворки используют один и тот же гем rack. Rack это фактически спецификация как HTTP сервер взаимодействует с приложением.В Руби сообществе это стандарт.
# rack-приложения -\            /- Puma
# 					\          /
# Sinatra -----------\|------|/--- Unicorn
# 					  | rack |
# Ruby on Rails -----/|------|\--- Thin
# 					/          \
# Hanami ----------/            \- WebBrick
# 
# 
# 