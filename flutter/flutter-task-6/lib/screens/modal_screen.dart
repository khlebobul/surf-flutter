import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:surf_flutter_courses_template/values/colors.dart';
import 'package:surf_flutter_courses_template/values/font.dart';

class ThemeModal extends StatefulWidget {
  const ThemeModal({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ThemeModalState createState() => _ThemeModalState();
}

class _ThemeModalState extends State<ThemeModal> {
  String? selectedTheme;
  String? descriptionText;

  @override
  Widget build(BuildContext context) {
    const String modalTitle = 'Тема оформления';
    const String closeButtonIcon = 'assets/icons/close.svg';
    const String readyButtonText = 'Готово';

    double height = descriptionText != null ? 400 : 300;

    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: SizedBox(
        height: height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(modalTitle, style: headingFont),
                  IconButton(
                    icon: SvgPicture.asset(closeButtonIcon),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            RadioTile(
              title: 'Системная',
              isSelected: selectedTheme == 'Системная',
              onSelect: () {
                setState(() {
                  selectedTheme = 'Системная';
                  descriptionText = null;
                });
              },
            ),
            RadioTile(
              title: 'Светлая',
              isSelected: selectedTheme == 'Светлая',
              onSelect: () {
                setState(() {
                  selectedTheme = 'Светлая';
                  descriptionText =
                      selectedTheme == 'Светлая' ? 'Цветовая схема 1' : null;
                });
              },
            ),
            if (descriptionText != null && selectedTheme == 'Светлая')
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 16),
                          child: Text(
                            descriptionText!,
                            style: labelBlockFont,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        ThemeSelector(
                          image: 'assets/icons/theme_one.svg',
                          text: 'Схема 1',
                          onPressed: () {},
                        ),
                        ThemeSelector(
                          image: 'assets/icons/theme_two.svg',
                          text: 'Схема 2',
                          onPressed: () {},
                        ),
                        ThemeSelector(
                          image: 'assets/icons/theme_tree.svg',
                          text: 'Схема 3',
                          onPressed: () {},
                        ),
                      ],
                    )
                  ],
                ),
              ),
            RadioTile(
              title: 'Темная',
              isSelected: selectedTheme == 'Темная',
              onSelect: () {
                setState(() {
                  selectedTheme = 'Темная';
                  descriptionText =
                      selectedTheme == 'Темная' ? 'Цветовая схема 2' : null;
                });
              },
            ),
            if (descriptionText != null && selectedTheme == 'Темная')
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 16),
                          child: Text(
                            descriptionText!,
                            style: labelBlockFont,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        ThemeSelector(
                          image: 'assets/icons/theme_one.svg',
                          text: 'Схема 1',
                          onPressed: () {},
                        ),
                        ThemeSelector(
                          image: 'assets/icons/theme_two.svg',
                          text: 'Схема 2',
                          onPressed: () {},
                        ),
                        ThemeSelector(
                          image: 'assets/icons/theme_tree.svg',
                          text: 'Схема 3',
                          onPressed: () {},
                        ),
                      ],
                    )
                  ],
                ),
              ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: SizedBox(
                width: 335,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: readyButtonLightColor1_1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: SizedBox(
                    height: 48,
                    child: Center(
                      child: Text(readyButtonText, style: readyButtonFont),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RadioTile extends StatefulWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onSelect;

  const RadioTile({
    Key? key,
    required this.title,
    required this.isSelected,
    required this.onSelect,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RadioTileState createState() => _RadioTileState();
}

class _RadioTileState extends State<RadioTile> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: RadioListTile(
            visualDensity: const VisualDensity(
              horizontal: VisualDensity.minimumDensity,
              vertical: VisualDensity.minimumDensity,
            ),
            activeColor: buttonLightColor1_1,
            title: Text(widget.title),
            value: widget.title,
            groupValue: widget.isSelected ? widget.title : null,
            onChanged: (newValue) {
              widget.onSelect();
            },
          ),
        ),
      ],
    );
  }
}

class ThemeSelector extends StatelessWidget {
  final String image;
  final String text;
  final bool isSelected;
  final VoidCallback onPressed;

  const ThemeSelector({
    Key? key,
    required this.image,
    required this.text,
    this.isSelected = false,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: GestureDetector(
        onTap: onPressed, // Вызываем onPressed при нажатии
        child: Column(
          children: [
            Container(
              width: 103,
              height: 64, // Adjusted height to accommodate text
              decoration: BoxDecoration(
                color: isSelected
                    ? buttonLightColor1_1
                    : themeSelectorLightColor1_1,
                borderRadius: BorderRadius.circular(8),
                border:
                    isSelected ? Border.all(color: buttonLightColor1_1) : null,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 4),
                    child: SizedBox(
                      width: 24,
                      height: 24,
                      child: SvgPicture.asset(
                        image,
                      ),
                    ),
                  ),
                  Text(
                    text,
                    style: TextStyle(
                        color: isSelected ? Colors.black : textLightColor1_1),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
