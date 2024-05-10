// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_courses_template/data/app_colors/app_colors.dart';
import 'package:surf_flutter_courses_template/data/theme_extensions/theme_colors.dart';
import 'package:surf_flutter_courses_template/data/theme_extensions/theme_text_styles.dart';
import 'package:surf_flutter_courses_template/domain/app_theme.dart';
import 'package:surf_flutter_courses_template/data/extensions/build_context_buttons_style_extension.dart';
import 'package:surf_flutter_courses_template/data/extensions/build_context_theme_color_extensions.dart';
import 'package:surf_flutter_courses_template/data/extensions/build_context_theme_text_style_extension.dart';
import 'package:surf_flutter_courses_template/core/theme_interactor/theme_interactor.dart';

// Боттомшит с темами для выбора
class ThemesBottomsheet extends StatefulWidget {
  const ThemesBottomsheet(
      {super.key,
      required this.currentTheme,
      required this.darkThemes,
      required this.lightThemes});
  final AppTheme? currentTheme;
  final List<AppTheme> darkThemes;
  final List<AppTheme> lightThemes;
  @override
  State<ThemesBottomsheet> createState() => _ThemesBottomsheetState();
}

class _ThemesBottomsheetState extends State<ThemesBottomsheet>
    with TickerProviderStateMixin {
  late int groupValue;
  late AppTheme? selectedTheme;
  // Анимация появления/сокрытия подвидов светлых тем
  late final AnimationController _controllerLight;
  // Анимация появления/сокрытия подвидов тёмных тем
  late final AnimationController _controllerDark;
  late final Animation<double> _animationLight = CurvedAnimation(
    parent: _controllerLight,
    curve: Curves.fastOutSlowIn,
  );
  late final Animation<double> _animationDark = CurvedAnimation(
    parent: _controllerDark,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void dispose() {
    _controllerLight.dispose();
    _controllerDark.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controllerLight = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _controllerDark = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    selectedTheme = widget.currentTheme;
    switch (widget.currentTheme) {
      case LightTheme():
        groupValue = 2;
        _controllerLight.fling();
      case DarkTheme():
        groupValue = 3;
        _controllerDark.fling();
      default:
        groupValue = 1;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final themesInteractor = context.watch<ThemeInteractor>();
    final textStyles = context.themeTextStyle;
    return Wrap(
      spacing: 10,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  const SizedBox(
                    width: 50,
                    child: Divider(
                      thickness: 3,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Тема оформления',
                        style: themesInteractor
                            .currentTheme.themeData?.appBarTheme.titleTextStyle,
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.close,
                          color: context.color?.appBarActionTextColor,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              RadioListTile.adaptive(
                  title: Text(
                    'Системная',
                    style: textStyles?.themesBottomSheetRadioLabelTextStyle,
                  ),
                  value: 1,
                  groupValue: groupValue,
                  onChanged: (value) {
                    // При выборе системный темы подменю сворачиваются
                    _controllerLight.reverse();
                    _controllerDark.reverse();
                    setState(() {
                      groupValue = value ?? 1;
                    });
                    selectedTheme = SystemTheme();
                  }),
              RadioListTile.adaptive(
                  title: Text('Светлая',
                      style: textStyles?.themesBottomSheetRadioLabelTextStyle),
                  value: 2,
                  groupValue: groupValue,
                  onChanged: (value) {
                    setState(() {
                      groupValue = value ?? 1;
                    });
                    // При выборе RadioButton светлых тем автоматически считается выбранной первая в списке
                    selectedTheme = widget.lightThemes[0];
                    // При выборе светлой темы подменю светлых тем разворачивается, тёмных - сворачивается
                    _controllerLight.forward();
                    _controllerDark.reverse();
                  }),
              SizeTransition(
                sizeFactor: _animationLight,
                child: _ThemesContainer(
                  themes: widget.lightThemes,
                  currentTheme: selectedTheme,
                  onThemeSelected: (AppTheme theme) {
                    selectedTheme = theme;
                  },
                ),
              ),
              RadioListTile.adaptive(
                  title: Text('Тёмная',
                      style: textStyles?.themesBottomSheetRadioLabelTextStyle),
                  value: 3,
                  groupValue: groupValue,
                  onChanged: (value) {
                    setState(() {
                      groupValue = value ?? 1;
                    });
                    // При выборе светлой темы подменю тёмных тем разворачивается, светлых - сворачивается
                    // При выборе RadioButton тёмных тем автоматически считается выбранной первая в списке
                    selectedTheme = widget.darkThemes[0];
                    _controllerLight.reverse();
                    _controllerDark.forward();
                  }),
              SizeTransition(
                sizeFactor: _animationDark,
                child: _ThemesContainer(
                  themes: widget.darkThemes,
                  currentTheme: selectedTheme,
                  onThemeSelected: (AppTheme theme) {
                    selectedTheme = theme;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0, top: 20),
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop(selectedTheme);
                  },
                  style: context.buttonStyle?.themesBottomSheetAcceptButtonStyle
                      .copyWith(
                    backgroundColor: MaterialStatePropertyAll(
                        context.color?.changeThemeBottomSheetButtonColor),
                  ),
                  child: const Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Готово',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// Виджет для отображения вариантов для светлой и тёмной тем
class _ThemesContainer extends StatefulWidget {
  final List<AppTheme> themes;
  final AppTheme? currentTheme;
  const _ThemesContainer(
      {required this.onThemeSelected,
      required this.currentTheme,
      required this.themes});
  final Function(AppTheme) onThemeSelected;
  @override
  State<_ThemesContainer> createState() => _ThemesContainerState();
}

class _ThemesContainerState extends State<_ThemesContainer> {
  late int checkedIndex;

  @override
  initState() {
    super.initState();
    checkedIndex = switch (widget.currentTheme) {
      SystemTheme()|| null => 0,
      LightGreenTheme() || DarkGreenTheme() => 0,
      LightBlueTheme() || DarkBlueTheme() => 1,
      LightOrangeTheme() || DarkOrangeTheme() => 2,
    };
  }

  @override
  Widget build(BuildContext context) {
    // доступные для текущей темы textStyles
    final textStyles = context.themeTextStyle;
    // доступные для текущей темы ThemeColors
    final ThemeColors? currentThemeColors = context.color;
    // Полученный из ThemeColors цвет фона
    final changeThemeBottomSheetExamplesBackgroundColor =
        currentThemeColors?.changeThemeBottomSheetExamplesBackgroundColor;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Цветовая схема',
            style: context.themeTextStyle?.secondaryTextFieldStyle,
          ),
        ),
        Row(
          children: widget.themes.expand((element) {
            // Для отрисовки кружков _GridColoredCircleElement для каждой темы (здесь element) понадобятся цвета этой темы и цвета шрифтов
            final selectedElementThemeColors =
                element.themeData?.extensions[ThemeColors] as ThemeColors;
            final textStyle = element.themeData?.extensions[ThemeTextStyles]
                as ThemeTextStyles;
            return [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        checkedIndex = widget.themes.indexOf(element);
                      });
                      widget.onThemeSelected(element);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: checkedIndex == widget.themes.indexOf(element)
                            ? Border.all(
                                color: context.color?.appBarActionTextColor ??
                                    AppColors.orange)
                            : null,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: changeThemeBottomSheetExamplesBackgroundColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 30,
                              width: 30,
                              child: GridView.count(
                                shrinkWrap: true,
                                crossAxisCount: 2,
                                children: [
                                  _GridColoredCircleElement(
                                    color:
                                        textStyle.secondaryTextFieldStyle.color,
                                  ),
                                  _GridColoredCircleElement(
                                    color: selectedElementThemeColors
                                        .appBarActionTextColor,
                                  ),
                                  const _GridColoredCircleElement(
                                    color: AppColors.white,
                                  ),
                                  const _GridColoredCircleElement(
                                    color: AppColors.greyLightTitle,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              element.name,
                              style:
                                  // Цвет текста на выделенной теме отличается
                                  checkedIndex == widget.themes.indexOf(element)
                                      ? textStyles?.themesBottomSheetLabelStyle
                                          .copyWith(
                                              color: context
                                                  .themeTextStyle
                                                  ?.secondaryTextFieldStyle
                                                  .color)
                                      : textStyles?.themesBottomSheetLabelStyle,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ];
          }).toList(),
        )
      ],
    );
  }
}

// Виджет для отображения кружка заданного цвета
class _GridColoredCircleElement extends StatelessWidget {
  final Color? color;
  const _GridColoredCircleElement({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(16),
          ),
          color: color,
        ),
      ),
    );
  }
}
