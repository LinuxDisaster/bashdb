# BashDB
### Установка deb пакета
После клонирования репозитория в корне будет лежать скрипт, который запускает установку deb пакета **bashdb**
> install_deb.sh
### Описание API
Вызов скрипта BashDB осуществляется командой
> bashdb [OPTION] [PARAMETR]
#### Добавить запись в БД
> bashdb -set [KEY] [VALUE]
#### Узменить запись в БД
> bashdb -change [KEY] [VALUE]
#### Удалить запись из БД
> bashdb -remove [KEY]
#### Вывести запись из БД
> bashdb -get [KEY]
#### Вывести запись из БД по списку ключей
> bashdb -get -f [FILE_PATH]
#### Вывести все записи из БД
> bashdb -show
#### Вывести первые n записи из БД
> bashdb -head [PARAMETR]
#### Вывести последнии n записи из БД
> bashdb -tail [PARAMETR]
#### Очистить БД
> bashdb -clear
