import 'package:flutter/material.dart';

void main() {
  runApp(PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Мое портфолио',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const PortfolioScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Портфолио Шалимова Глеб'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('assets/avatar.png'),
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
                    text: 'LinkedIn',
                    url: 'https://www.linkedin.com/in/gleb-shalimov-5b502622b/',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SocialLinkButton(
                    icon: Icons.people,
                    text: 'Twitter',
                    url: 'https://twitter.com/khlebobul',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SocialLinkButton(
                    icon: Icons.code,
                    text: 'GitHub',
                    url: 'https://github.com/khlebobul',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: const [
                  Text(
                    'Обо мне',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                  ),
                  Text(
                      'Я инженер-программист из Санкт-Петербурга с опытом работы в индустрии программного обеспечения более 3 лет. Мне нравится создавать чистые, удобные и доступные пользовательские интерфейсы как для пользователей, так и для разработчиков. В данный момент я обучаюсь в Иннополисе.',
                      style: TextStyle(fontSize: 18)),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Опыт',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 10),
                  ExperienceItem(
                      text: 'Ассистент преподавателя в университете Иннополис'),
                  ExperienceItem(text: 'Аналитик данных (стажер)'),
                  ExperienceItem(text: 'Junior Angular developer'),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Проекты',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text('1. Расширения для Raycast (150+ загрзок)',
                      style: TextStyle(fontSize: 18)),
                  Text('2. Телеграм-канал @ph_daily (520+ подписчиков)',
                      style: TextStyle(fontSize: 18)),
                  Text('3. Интернет-магазин с работами робота-художника',
                      style: TextStyle(fontSize: 18)),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Увлечения',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Люблю играть в волейбол, путешествовать, рисовать с помощью робота художника',
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
    super.key,
    required this.icon,
    required this.text,
    required this.url,
  });

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

  const ExperienceItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.work),
      title: Text(text),
    );
  }
}
