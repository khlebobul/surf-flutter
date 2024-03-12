import 'package:super_clipboard/super_clipboard.dart';
import '../utils/extension.dart';

// Интерактор для сохранения данных о цвете в буфер обмена
class ClipboardWriteInteractor {
  final ClipboardWriter clipboardWriter;

  ClipboardWriteInteractor({required this.clipboardWriter});
  // Функция записи, первый аргумент Record возвращает результат операции, вотрой - записанный текст
  Future<(bool, String)> write(String text) async {
    try {
      await clipboardWriter.write([
        DataWriterItem()
          ..add(
            Formats.plainText(text),
          )
      ]);
      return (true, text);
    } on Exception catch (_) {
      return (false, 'Something went wrong'.hardcoded);
    }
  }
}
