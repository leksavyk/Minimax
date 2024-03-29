# Rock_Paper_Scissors_Game

**Игра "Камень, Ножницы, Бумага"** <br>
Это консольная игра "Камень, Ножницы, Бумага" с использованием Ruby и библиотеки Tk для графического интерфейса и Gosu для воспроизведения звуковых эффектов.

## Установка и запуск
1. Убедитесь, что у вас установлен Ruby.
2. Установите библиотеки Tk и Gosu, выполнив следующие команды:

```bash
gem install tk
gem install gosu
```

3. Запустите игру, выполните:
```bash
ruby SimpleGame.rb
```

## Инструкции по игре
1. Откройте игру.
2. Вас приветствует графический интерфейс с надписью "Rock paper scissors game".
3. Вы можете выбрать один из трех вариантов: "Scissors", "Stone" или "Paper", нажав соответствующую кнопку.
4. Компьютер также сделает свой выбор.
5. Результат игры отображается в разделе "Result".

## Структура проекта
* **"GameLogicHandler.rb:"** Модуль с логикой игры.
* **"MusicHandler.rb:"** Модуль для управления звуковыми эффектами.
* **"SimpleGame.rb:"** Основной файл, который запускает игру и создает графический интерфейс.
* **"WinSound.mp3" и "LoseSound.mp3"**: Звуковые файлы для выигрыша и проигрыша.

## Настройка цветов и шрифтов
В коде есть возможность настроить цвета и шрифты для графического интерфейса. Используйте константы для определения цветов, чтобы легко изменять внешний вид игры.

## Оптимизация кода
Код был оптимизирован для лучшей читаемости и поддерживаемости. Использованы модули для логики игры и управления звуками, что делает код более структурированным.

## Завершение
Наслаждайтесь игрой "Камень, Ножницы, Бумага"!
