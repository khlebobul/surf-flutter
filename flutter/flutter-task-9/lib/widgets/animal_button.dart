import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:surf_flutter_courses_template/ui/colors.dart';
import 'package:surf_flutter_courses_template/ui/fonts.dart';
import 'package:surf_flutter_courses_template/widgets/animal_check_box.dart';

class AnimalButton extends StatelessWidget {
  final String svgPath;
  final String label;
  final Color color;
  final VoidCallback onTap;
  final bool isSelected;

  const AnimalButton({
    super.key,
    required this.svgPath,
    required this.label,
    required this.onTap,
    this.color = AppColors.white,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 72,
            width: 72,
            decoration: BoxDecoration(
              color: isSelected ? AppColors.red : color,
              borderRadius: BorderRadius.circular(12.0),
            ),
            padding: const EdgeInsets.all(20.0),
            child: SvgPicture.asset(
              svgPath,
              width: 32,
              height: 32,
              color: isSelected ? AppColors.white : AppColors.black,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            label,
            style: AppTextStyles.categoryTextStyle,
          ),
        ],
      ),
    );
  }
}
