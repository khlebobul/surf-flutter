import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/constants.dart';
import 'package:surf_flutter_courses_template/ui/colors.dart';
import 'package:surf_flutter_courses_template/widgets/animal_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AnimalButton(
                  svgPath: dogSvgPath,
                  label: dogLabel,
                  isSelected: selectedIndex == 0,
                  onTap: () {
                    setState(() {
                      selectedIndex = 0;
                    });
                  },
                ),
                AnimalButton(
                  svgPath: catSvgPath,
                  label: catLabel,
                  isSelected: selectedIndex == 1,
                  onTap: () {
                    setState(() {
                      selectedIndex = 1;
                    });
                  },
                ),
                AnimalButton(
                  svgPath: parrotSvgPath,
                  label: parrotLabel,
                  isSelected: selectedIndex == 2,
                  onTap: () {
                    setState(() {
                      selectedIndex = 2;
                    });
                  },
                ),
                AnimalButton(
                  svgPath: hamsterSvgPath,
                  label: hamsterLabel,
                  isSelected: selectedIndex == 3,
                  onTap: () {
                    setState(() {
                      selectedIndex = 3;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}