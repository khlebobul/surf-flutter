import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/values/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: backgroundLightColor,
          title: const Text('Профиль'),
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back,
            ),
          ),
          actions: [
            TextButton(onPressed: () {}, child: const Text('Save')),
          ],
        ),
        body: Container(
          color: backgroundLightColor,
        ));
  }
}
