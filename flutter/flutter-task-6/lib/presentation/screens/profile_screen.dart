// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_courses_template/domain/app_theme.dart';
import 'package:surf_flutter_courses_template/data/extensions/build_context_buttons_style_extension.dart';
import 'package:surf_flutter_courses_template/data/extensions/build_context_theme_color_extensions.dart';
import 'package:surf_flutter_courses_template/data/extensions/build_context_theme_text_style_extension.dart';
import 'package:surf_flutter_courses_template/core/theme_interactor/theme_interactor.dart';
import 'package:surf_flutter_courses_template/presentation/widgets/themes_bottomsheet.dart';

// Экран профиля
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themesInteractor = context.watch<ThemeInteractor>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Профиль'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Save',
              style: context.themeTextStyle?.secondaryTextFieldStyle
                  .copyWith(color: context.color?.appBarActionTextColor),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: CircleAvatar(
                minRadius: 5,
                maxRadius: 50,
                backgroundImage: const AssetImage('lib/assets/avatar.png'),
                child: Text(
                  'Edit',
                  style: themesInteractor
                      .currentTheme.themeData?.primaryTextTheme.titleMedium,
                ),
              ),
            ),
            Center(
              child: Text(
                'Мои награды',
                style: context.themeTextStyle?.secondaryTextFieldStyle,
              ),
            ),
            Image.asset('lib/assets/medals.png'),
            const _TextField(
              label: 'Имя',
              text: 'Маркус Хассельборг',
            ),
            const _TextField(
              label: 'Email',
              text: 'Markus@gmail.com',
            ),
            const _TextField(
              label: 'Дата рождения',
              text: '03.03.1988',
            ),
            _TextField(
              label: 'Команда',
              text: 'Сборная Швеции',
              editable: true,
              onPressed: () {},
            ),
            _TextField(
              label: 'Позиция',
              text: 'Скип',
              editable: true,
              onPressed: () {},
            ),
            _TextField(
              label: 'Тема оформления',
              text: themesInteractor.currentTheme.name,
              editable: true,
              onPressed: () async {
                final result = await showModalBottomSheet<AppTheme>(
                  context: context,
                  builder: (context) {
                    return ThemesBottomsheet(
                      currentTheme: themesInteractor.currentTheme,
                      darkThemes: themesInteractor.getDarkThemes(),
                      lightThemes: themesInteractor.getLightThemes(),
                    );
                  },
                );
                if (result != null) {
                  themesInteractor.updateTheme(result);
                }
              },
            ),
            OutlinedButton(
              style: context.buttonStyle?.logoutButtonStyle,
              onPressed: () {},
              child: const Text(
                'Log out',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TextField extends StatefulWidget {
  const _TextField(
      {super.key,
      required this.text,
      required this.label,
      this.editable = false,
      this.onPressed})
      : assert((editable == true && onPressed != null) ||
            editable == false && onPressed == null);

  final String text;
  final String label;
  final bool editable;
  final VoidCallback? onPressed;

  @override
  State<_TextField> createState() => _TextFieldState();
}

class _TextFieldState extends State<_TextField> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Card(
        color: context.color?.profileScreenChipsBackgroundColor,
        child: SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.label,
                        style: context.themeTextStyle?.secondaryTextFieldStyle,
                      ),
                      Text(
                        widget.text,
                        style: context.themeTextStyle?.primaryTextFieldStyle,
                      ),
                    ]),
              ),
              if (widget.editable)
                IconButton(
                  onPressed: widget.onPressed,
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                    color: context.color?.appBarActionTextColor,
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
