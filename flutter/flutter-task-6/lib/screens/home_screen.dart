import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:surf_flutter_courses_template/screens/modal_screen.dart';
import 'package:surf_flutter_courses_template/values/colors.dart';
import 'package:surf_flutter_courses_template/values/font.dart';

const String appBarTitle = 'Профиль';
const String appBarButtonText = 'Save';
const String awardTitle = 'Мои награды';
const String appBarIconPath = 'assets/icons/back.svg';
const String avatarPath = 'assets/images/avatar.png';
const String nextIconPath = 'assets/icons/next.svg';
const String firstPlaceImagePath = 'assets/images/first_place.png';
const String secondPlaceImagePath = 'assets/images/second_place.png';
const String thirdPlaceImagePath = 'assets/images/third_place.png';
const EdgeInsets leadingPadding = EdgeInsets.only(left: 20.0);
const EdgeInsets actionPadding = EdgeInsets.only(right: 20.0);

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundLightColor1_1,
        title: Text(appBarTitle, style: headingFont),
        leading: Padding(
          padding: leadingPadding,
          child: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              appBarIconPath,
            ),
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: actionPadding,
            child: TextButton(
              onPressed: () {},
              child: Text(appBarButtonText, style: iconButtonFont),
            ),
          ),
        ],
      ),
      body: Container(
        color: backgroundLightColor1_1,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: Image.asset(avatarPath),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Text(awardTitle, style: achievementsFont),
              ),
              const AwardRow(),
              const SizedBox(height: 24),
              TextBlock(
                  label: 'Имя',
                  text: 'Маркус Хассельборг',
                  icon: false,
                  onPressed: () {},
                  context: context),
              TextBlock(
                  label: 'Email',
                  text: 'MarkusHSS@gmail.com',
                  icon: false,
                  onPressed: () {},
                  context: context),
              TextBlock(
                  label: 'Дата рождения',
                  text: '03.03.1986',
                  icon: false,
                  onPressed: () {},
                  context: context),
              TextBlock(
                  label: 'Команда',
                  text: 'Сборная Швеции',
                  icon: true,
                  onPressed: () {},
                  context: context),
              TextBlock(
                  label: 'Позиция',
                  text: 'Скип',
                  icon: true,
                  onPressed: () {},
                  context: context),
              TextBlock(
                label: 'Тема оформления',
                text: 'Системная',
                icon: true,
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return const ThemeModal();
                    },
                  ); // Вызываем метод для отображения модального окна
                },
                context: context,
              ),
              const SizedBox(height: 64),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  side: BorderSide(
                    color: logOutButtonLightColor1_1,
                  ),
                ),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return const ThemeModal();
                    },
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 16),
                  child: SizedBox(
                      width: 290,
                      child: Center(
                          child: Text('Log out', style: loOutButtonFont))),
                ),
              ),
              const SizedBox(height: 18),
            ],
          ),
        ),
      ),
    );
  }
}

class AwardRow extends StatelessWidget {
  const AwardRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Image.asset(firstPlaceImagePath),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Image.asset(firstPlaceImagePath),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Image.asset(thirdPlaceImagePath),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Image.asset(secondPlaceImagePath),
          ),
          Image.asset(thirdPlaceImagePath),
        ],
      ),
    );
  }
}

// Widget for text blocks// Widget for text blocks
class TextBlock extends StatelessWidget {
  final String label;
  final String text;
  final bool icon;
  final Function onPressed;
  final BuildContext context;

  const TextBlock({
    Key? key,
    required this.label,
    required this.text,
    required this.icon,
    required this.onPressed,
    required this.context,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
        width: 335,
        height: 56,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: textBlockLightColor1_1,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: labelBlockFont,
                ),
                Text(text, style: textBlockFont),
              ],
            ),
            if (icon) SvgPicture.asset(nextIconPath),
          ],
        ),
      ),
    );
  }
}
