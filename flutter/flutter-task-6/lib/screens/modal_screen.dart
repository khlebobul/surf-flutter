// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:surf_flutter_courses_template/values/colors.dart';
import 'package:surf_flutter_courses_template/values/font.dart';

class ThemeModal extends StatefulWidget {
  const ThemeModal({Key? key}) : super(key: key);

  @override
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

    double height = descriptionText != null ? 469 : 352;

    return SizedBox(
      height: height,
      child: Column(
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
              child: Text(
                descriptionText!,
                style: const TextStyle(color: Colors.black),
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
              child: Text(
                descriptionText!,
                style: const TextStyle(color: Colors.black),
              ),
            ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: readyButtonLightColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: SizedBox(
                width: 335,
                height: 48,
                child: Center(
                  child: Text(readyButtonText, style: readyButtonFont),
                ),
              ),
            ),
          ),
        ],
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
  _RadioTileState createState() => _RadioTileState();
}

class _RadioTileState extends State<RadioTile> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: RadioListTile(
        activeColor: buttonLightColor,
        title: Text(widget.title),
        value: widget.title,
        groupValue: widget.isSelected ? widget.title : null,
        onChanged: (newValue) {
          widget.onSelect();
        },
      ),
    );
  }
}
