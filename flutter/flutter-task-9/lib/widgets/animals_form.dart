import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/ui/colors.dart';
import 'package:surf_flutter_courses_template/ui/fonts.dart';

class AnimalFormField extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? errorText;

  const AnimalFormField({
    Key? key,
    required this.labelText,
    required this.keyboardType,
    required this.controller,
    this.errorText,
  }) : super(key: key);

  @override
  _AnimalFormFieldState createState() => _AnimalFormFieldState();
}

class _AnimalFormFieldState extends State<AnimalFormField> {
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 56,
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextFormField(
                  controller: widget.controller,
                  focusNode: _focusNode,
                  keyboardType: widget.keyboardType,
                  decoration: InputDecoration(
                    labelText: widget.labelText,
                    labelStyle: widget.errorText != null
                        ? AppTextStyles.formsTextStyle
                            .copyWith(color: AppColors.errorText)
                        : AppTextStyles.formsTextStyle,
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            if (widget.errorText != null)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  widget.errorText!,
                  style: const TextStyle(
                    color: AppColors.errorText,
                    fontSize: 12.0,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
