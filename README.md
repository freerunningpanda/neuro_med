# UpMind+

Проект находится в стадии разработки...  
Проект работает на моковых данных, кроме авторизации  

Приложение позволяющее просматривать видеосессии для реабилитации организма.  
Есть роли: гость, пациент.  
Гость может просматривать список доступных программ, где может оставить заявку на консультацию.  
У пациента добавляется раздел "Мои программы" - где он может смотреть свои видеосессии.  
В дальнейшем роли пользователя будут добавляться.  


Войти под пациентом:  
Логин: max@gmail.com  
Пароль: f<qn(3{(  

https://github.com/user-attachments/assets/c3918c3d-dc63-4701-8438-261ea3c74acb

Версия Flutter для запуска: 3.24.3

Тестировалось на эмуляторе Android 12

Для запуска проекта выполните команды в консоле:
1. `flutter pub get` - подтянуть зависимости
2. `dart pub global activate flutter_gen` - активировать генератор ассетов
3. `dart run build_runner build` - запустить кодогенерацию
4. Если запуск через VsCode, то выбрать конфиг upmind_dev и нажать запустить
5. Можно запустить из командной строки: flutter run -t lib/main_dev.dart --flavor dev -d <имя_устройства>
