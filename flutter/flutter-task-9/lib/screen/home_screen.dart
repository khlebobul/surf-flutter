import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/constants.dart';
import 'package:surf_flutter_courses_template/ui/colors.dart';
import 'package:surf_flutter_courses_template/ui/fonts.dart';
import 'package:intl/intl.dart';
import 'package:surf_flutter_courses_template/widgets/animal_button.dart';
import 'package:surf_flutter_courses_template/widgets/animal_check_box.dart';
import 'package:surf_flutter_courses_template/widgets/animals_form.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? selectedIndex;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  String? _nameError;
  String? _birthdayError;
  String? _weightError;
  String? _emailError;
  bool _isLoading = false;

  void _validateForm() {
    setState(() {
      _nameError = null;
      _birthdayError = null;
      _weightError = null;
      _emailError = null;

      if (_nameController.text.length < 3 || _nameController.text.length > 20) {
        _nameError = nameErrorText;
      }

      final DateFormat dateFormat = DateFormat('dd.MM.yyyy');
      DateTime? birthday;
      try {
        birthday = dateFormat.parseStrict(_birthdayController.text);
      } catch (e) {
        _birthdayError = birhdayErrorText;
      }

      if (birthday != null && birthday.isAfter(DateTime.now())) {
        _birthdayError = birhdayErrorText;
      }

      final double? weight = double.tryParse(_weightController.text);
      if (weight == null || weight <= 0) {
        _weightError = weightErrorText;
      }

      final RegExp emailRegExp = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
      if (!emailRegExp.hasMatch(_emailController.text)) {
        _emailError = ownerEmailErrorText;
      }

      if (_nameError == null &&
          _birthdayError == null &&
          _weightError == null &&
          _emailError == null) {
        _showLoadingIndicator();
      }
    });
  }

  Future<void> _showLoadingIndicator() async {
    setState(() {
      _isLoading = true;
    });
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _isLoading = false;
    });
    // Handle form submission success (e.g., navigate to another screen, show success message, etc.)
  }

  Future<void> _selectBirthday(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _birthdayController.text = DateFormat('dd.MM.yyyy').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
      ),
      backgroundColor: AppColors.backgroundColor,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
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
                  const SizedBox(height: 24),
                  AnimalFormField(
                    labelText: nameHintText,
                    controller: _nameController,
                    keyboardType: TextInputType.name,
                    errorText: _nameError,
                  ),
                  InkWell(
                    onTap: () => _selectBirthday(context),
                    child: IgnorePointer(
                      child: AnimalFormField(
                        labelText: birthdayHintText,
                        controller: _birthdayController,
                        keyboardType: TextInputType.datetime,
                        errorText: _birthdayError,
                      ),
                    ),
                  ),
                  AnimalFormField(
                    labelText: weightHintText,
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    errorText: _weightError,
                  ),
                  AnimalFormField(
                    labelText: ownerEmailHintText,
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    errorText: _emailError,
                  ),
                  if (selectedIndex == 0 || selectedIndex == 1)
                    const VaccinationForm(),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
          if (_isLoading) const CircularProgressIndicator(),
          if (!_isLoading)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                height: 56,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: selectedIndex != null
                      ? () {
                          _validateForm();
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        selectedIndex != null ? AppColors.red : Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: Text(
                    saveButtonText,
                    style: selectedIndex != null
                        ? AppTextStyles.buttonActiveTextStyle
                        : AppTextStyles.buttonInactiveTextStyle,
                  ),
                ),
              ),
            ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
