import 'package:flutter/material.dart';

class AppStrings {
  static const String appTitle = 'Мое портфолио';
  static const String portfolioTitle = 'Портфолио Шалимова Глеб';
  static const String aboutMeTitle = 'Обо мне';
  static const String experienceTitle = 'Опыт';
  static const String projectsTitle = 'Проекты';
  static const String interestsTitle = 'Увлечения';
  static const String linkedInText = 'LinkedIn';
  static const String twitterText = 'Twitter';
  static const String githubText = 'GitHub';
  static const String aboutMeContent =
      'Я инженер-программист из Санкт-Петербурга с опытом работы в индустрии программного обеспечения более 3 лет. Мне нравится создавать чистые, удобные и доступные пользовательские интерфейсы как для пользователей, так и для разработчиков. В данный момент я обучаюсь в Иннополисе.';
  static const List<String> experienceItems = [
    'Ассистент преподавателя в университете Иннополис',
    'Аналитик данных (стажер)',
    'Junior Angular developer'
  ];
  static const List<String> projects = [
    'Расширения для Raycast (150+ загрзок)',
    'Телеграм-канал @ph_daily (520+ подписчиков)',
    'Интернет-магазин с работами робота-художника'
  ];
  static const String interestsContent =
      'Люблю играть в волейбол, путешествовать, рисовать с помощью робота художника';
}

class AppAssets {
  static const String avatarPath = 'assets/avatar.png';
}

class AppLinks {
  static const String linkedInUrl =
      'https://www.linkedin.com/in/gleb-shalimov-5b502622b/';
  static const String twitterUrl = 'https://twitter.com/khlebobul';
  static const String githubUrl = 'https://github.com/khlebobul';
}

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appTitle,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const PortfolioScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.portfolioTitle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage(AppAssets.avatarPath),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Глеб Шалимов',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SocialLinkButton(
                    icon: Icons.work_history,
                    text: AppStrings.linkedInText,
                    url: AppLinks.linkedInUrl,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SocialLinkButton(
                    icon: Icons.people,
                    text: AppStrings.twitterText,
                    url: AppLinks.twitterUrl,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SocialLinkButton(
                    icon: Icons.code,
                    text: AppStrings.githubText,
                    url: AppLinks.githubUrl,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  const Text(
                    AppStrings.aboutMeTitle,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(5.0),
                  ),
                  const Text(
                    AppStrings.aboutMeContent,
                    style: TextStyle(fontSize: 18),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      AppStrings.experienceTitle,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 10),
                  for (String item in AppStrings.experienceItems)
                    ExperienceItem(text: item),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      AppStrings.projectsTitle,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 10),
                  for (String item in AppStrings.projects)
                    Text(
                      item,
                      style: const TextStyle(fontSize: 18),
                    ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      AppStrings.interestsTitle,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    AppStrings.interestsContent,
                    style: TextStyle(fontSize: 18),
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

class SocialLinkButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final String url;

  const SocialLinkButton({
    Key? key,
    required this.icon,
    required this.text,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(icon),
      label: Text(text),
    );
  }
}

class ExperienceItem extends StatelessWidget {
  final String text;

  const ExperienceItem({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.work),
      title: Text(text),
    );
  }
}
