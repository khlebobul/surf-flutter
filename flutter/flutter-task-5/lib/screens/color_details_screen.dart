import 'package:flutter/material.dart';
import '/data/color.dart';
import '/widgets/extension.dart';
import '/widgets/clipboard.dart';

// Детальная информация о цвете
class PalleteDetailsScreen extends StatelessWidget {
  const PalleteDetailsScreen(
      {super.key,
      required this.colorElement,
      required this.clipboardWriteInteractor});
  // Отображаемый цвет
  final ColorClass colorElement;
  // Горизонтальный паддинг
  final double kHorizontalPadding = 20;
  // вертикальный паддинг
  final double kVerticalPadding = 30;
  // ИНтерактор для записи в буфер обмена
  final ClipboardWriteInteractor clipboardWriteInteractor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: Hero(
              tag: colorElement.name,
              child: Container(
                color: colorElement.hexColor,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: kHorizontalPadding, top: kVerticalPadding),
            child: Text(
              colorElement.name,
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: kVerticalPadding, horizontal: kHorizontalPadding),
            child: _FieldWithShadow(
                text: ['Hex', colorElement.clearValue],
                onTap: onTap(colorElement.clearValue),
                showCopyPostfix: true),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: kVerticalPadding, horizontal: kHorizontalPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _FieldWithShadow(
                  text: ['Red'.hardcoded, colorElement.redPart],
                  onTap: onTap(colorElement.redPart),
                ),
                _FieldWithShadow(
                  text: ['Green'.hardcoded, colorElement.greenPart],
                  onTap: onTap(colorElement.redPart),
                ),
                _FieldWithShadow(
                  text: ['Blue'.hardcoded, colorElement.bluePart],
                  onTap: onTap(colorElement.redPart),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<(bool, String)> onTap(String text) async {
    final result = await clipboardWriteInteractor.write(text);
    return result;
  }
}

// Класс "поля" с информацией, доступной для копирования
class _FieldWithShadow extends StatefulWidget {
  const _FieldWithShadow(
      {required this.text, this.showCopyPostfix = false, required this.onTap});
  // Для правильного отображения состоит из 2-х строк: имя - значение
  final List<String> text;
  // Показывать постфикс с иконкой Копировать
  final bool showCopyPostfix;
  // Для вызова по нажатию
  final Future<(bool, String)> onTap;
  @override
  State<_FieldWithShadow> createState() => _FieldWithShadowState();
}

class _FieldWithShadowState extends State<_FieldWithShadow> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final resultString =
            widget.text.reduce((value, element) => value += ' $element');
        // запись в буфер, возвращаемый результат записывается
        final result = await widget.onTap;
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Center(
            // Покажем сообщение об ошибке, если нужно
            child: result.$1 ? Text(resultString) : Text(result.$2),
          ),
        ));
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: widget.text
                .map<Widget>(
                  (element) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    // Добавим иконку "Копировать", если showCopyPostfix == true
                    child: (widget.showCopyPostfix &&
                            widget.text.indexOf(element) == 1)
                        ? Row(
                            children: [
                              Text(element),
                              const SizedBox(
                                width: 10,
                              ),
                              const Icon(
                                Icons.copy_sharp,
                                color: Colors.black54,
                              )
                            ],
                          )
                        : Text(element),
                  ),
                )
                .toList()),
      ),
    );
  }
}
