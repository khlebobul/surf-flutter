## Photo Gallery App

Я решил немного прокачать приложение и сделать не просто "нельзяграм" с набором изображений, а подключить к этому Supabase. Надеюсь, что такая самодеятельность разрешается. 
Supabase – это opensource альтернатива Firebase. Мне очень нравится этот сервис. Несколько раз я даже использовал его в разработке, а теперь решил добавить его в приложение на Flutter. К тому же у них есть крутейший [грайд и интеграция с Flutter](https://supabase.com/docs/guides/getting-started/quickstarts/flutter).

На тот случай, если кто-то кроме менторов на курсе будет смотреть этот README, то прикреплю еще несколько классных ссылок:

- [Build a User Management App with Flutter](https://supabase.com/docs/guides/getting-started/tutorials/with-flutter)
- [Блог про Flutter](https://supabase.com/blog/tags/flutter)
- [Hero animations](https://docs.flutter.dev/ui/animations/hero-animations)

## Приложение

Все приложение выполнено в соответсвии с техническими требованиями к заданию с небольшими дополнениями. К приложению подключена БД Supabase и пользователь может загружать свои фото в БД, которые отображаются в приложении.

## Вопросы

1. Подскажите, пожалуйста, как лучше хранить API ключи и URL к БД? 
>Например, при создании [приложения с API OpenAI на Flutter](https://github.com/khlebobul/ChatGPT-Flutter-App), я получил блокировку ключа из-за выгрузки его в публичный репозиторий. С Supabase такого нет, но все равно это не безопасно.  

Я создал отдельный файл для ключа и URL, который добавил в .gitignore

```dart
await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseKey,
  );
```

Но в таком случае изображения будут доступны только мне.
