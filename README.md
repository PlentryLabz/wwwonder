# Plentry

## Инструкция по установке и запуску приложения.

#### Все нижеизложенное относится к любым RoR-проектам и может быть использовано как памятка на все дальнейшие начинания.

* Инструкция написана в контексте ОС Ubuntu или чего-то подобного. Для тех, кто предпочитает OS X я рекомендую использовать [Vagrant](http://www.vagrantup.com/) или искать всю инфу самому. В основном все отличия заключаются в использовании brew вместо apt-get. Но есть и некоторые тонкости, из-за которых могут возникнуть проблемы. Используйте [Vagrant](http://www.vagrantup.com/).

* Установка RVM.
```
\curl -sSL https://get.rvm.io | bash -s stable
```
RMV (Ruby Version Manager) - это средство для управления версиями Ruby. Подробно [здесь](http://habrahabr.ru/post/120504/).

* Далее устанавливаем Ruby 1.9.3.
```
rvm install 1.9.3
```
И устанавливаем Rails как обычный гем.
```
gem install rails -v 3.2.13
```
*Важно! Убедитесь, что установлены именно указанные версии Ruby и Rails.*

* Установка и настройка [PostgreSQL](http://hexvolt.blogspot.ru/2012/11/postgresql-91-ubuntu-1204.html).

* Установка [MongoDB](http://docs.mongodb.org/manual/tutorial/install-mongodb-on-ubuntu/).

* После этого клонируем приложение из репозитория на гитхабе. Из папки приложения запускаем bundle для установки нужных гемов.
Рекомендую перед установкой гемов прописать в файл `~/.gemrc` следующее:
```
gem: --no-rdoc --no-ri
```
Возможно, некоторые гемы откажутся ставиться с первого раза и будут выпадать ошибки. Решение как всегда - гугл, первая ссылка. Скорее всего, что-то нужно доставить через apt-get, например nodejs, minimagic и т.д. Здесь придется немного повозиться, а может и нет и все пройдет гладко как у Шумахера (в известном смысле).

* Прогоняем миграции (подготавливаем структуру базы). Сначала скопируйте файл `config/database.sample.yml` в `config/database.yml` и перепишите его под свои настройки postgres. Затем:
```
rake db:setup && rake db:migrate
```
(чтобы узнать все команды rake наберите `rake -T`)
Вообще на этом этапе возникает больше всего проблем, которые, как правило, решаются индивидуально. Чаще всего проблема с локализацией postgres или вы где-то облажались в файле `config/database.yml`. Проверьте еще, запущен ли postgres (в ошибке выдается что-то о том, что невозможен коннект к соккету). Но чаще всего (процентов 99 случаев) проблема в файле `config/database.yml`.

* Наконец, мы готовы запустить приложение. Скорее всего, в качестве веб-сервера будет использоваться unicorn и поэтому делается это так:
```
inicorn_rails -p 3000
```
После чего в браузере на `localhost:3000/` вы увидите запущенное приложение с чистой, как слеза Святой Девы Марии, базой, которую вы всегда можете засидить из консоли Rails (`rails c`).

## Git

Используем [git-flow](http://habrahabr.ru/post/147260/). Читаем и делаем все, как там написано. Все очень просто:
* Есть ветка `master`. Ее не трогаем никогда. Никогда - это означает ни что иное, как никогда.
* `develop` - рабочая ветка. Сюда сливаем все из веток-фич, предварительно pull-request.
* Для каждой новой фичи создаем отдельную ветку вида `feature/` согласно git-flow:
```
git flow feature start my_new_branch
```
* для мелких фиксов и срочных багов - `hotfix/` (по-хорошему, должно использоваться редко).

Если работаешь с кем-то в одной ветке, в начале работы проверяешь статус и далее `git pull --rebase`. Если не знаешь, как работает `rebase` не используешь его никогда (см. выше, что такое никогда) за исключением этого случая.
Если однажды ты замечаешь за собой, что твоя рука набирает что-то типа `git ... --f`, остановись и подумай. Если дело дошло до того, что ты набрал `git ... --for`, то ударь себя по руке. Если ты набрал `git ... --force` и нажал enter, то ты либо мудак, либо у тебя были веские на то причины, подумай над этим.
Прошу следовать этим правилам и тогда разработка будет легка и приятна, как легкий ветерочек на берегу озера Селигер.

## Bower

Пакетный менеджер для javascript-а, подробней [тут](http://bower.io/).

Для корректной установки сделайте след. действия, взял [отсюда](http://stackoverflow.com/questions/12913141/installing-from-npm-fails):
```
sudo apt-get update
sudo apt-get install -y python-software-properties
sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get install nodejs
sudo npm install bower -g
```

Теперь ставим js-ные пакеты с помощью [bower-rails](https://github.com/42dev/bower-rails):
```
rake bower:install
```

## Sidekiq

Работа с очередью сообщений. Использует многопоточность при обработки сообщений. В качестве бэкенда - Redis.

[офф.сайт](http://sidekiq.org/)

[github](https://github.com/mperham/sidekiq)

Инструкции по установке и запуску Redis - [тут](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-redis).

Запуск очереди - `bundle exec sidekiq`

Монитор - `/sidekiq`

## Конфиги

Иногда для работы чего-то нужно заранее задать конфигурацию, например конфиги по работе с API Амазона или смс-провайдера. Эти данные не должны попасть в гит, поэтому передаются каким-то другим способом. Такие конфиги должны быть прописаны в файле `config/initializers/confgus.rb` перед запуском приложения. Пример содержимого - `config/configus.sample.rb`.