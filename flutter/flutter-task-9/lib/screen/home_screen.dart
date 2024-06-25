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
      _nameError = _validateName(_nameController.text);
      _birthdayError = _validateBirthday(_birthdayController.text);
      _weightError = _validateWeight(_weightController.text);
      _emailError = _validateEmail(_emailController.text);

      if (_nameError == null &&
          _birthdayError == null &&
          _weightError == null &&
          _emailError == null) {
        _showLoadingIndicator();
      }
    });
  }

  String? _validateName(String name) {
    if (name.length < 3 || name.length > 20) {
      return nameErrorText;
    }
    return null;
  }

  String? _validateBirthday(String birthday) {
    final DateFormat dateFormat = DateFormat('dd.MM.yyyy');
    DateTime? birthdayDate;
    try {
      birthdayDate = dateFormat.parseStrict(birthday);
    } catch (e) {
      return birhdayErrorText;
    }

    if (birthdayDate.isAfter(DateTime.now())) {
      return birhdayErrorText;
    }
    return null;
  }

  String? _validateWeight(String weight) {
    final double? weightValue = double.tryParse(weight);
    if (weightValue == null || weightValue <= 0) {
      return weightErrorText;
    }
    return null;
  }

  String? _validateEmail(String email) {
    final RegExp emailRegExp = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    if (!emailRegExp.hasMatch(email)) {
      return ownerEmailErrorText;
    }
    return null;
  }

  Future<void> _showLoadingIndicator() async {
    setState(() {
      _isLoading = true;
    });
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _isLoading = false;
    });
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
                    onFieldSubmitted: (value) {
                      setState(() {
                        _nameError = _validateName(value);
                      });
                    },
                  ),
                  InkWell(
                    onTap: () => _selectBirthday(context),
                    child: IgnorePointer(
                      child: AnimalFormField(
                        labelText: birthdayHintText,
                        controller: _birthdayController,
                        keyboardType: TextInputType.datetime,
                        errorText: _birthdayError,
                        onFieldSubmitted: (value) {
                          setState(() {
                            _birthdayError = _validateBirthday(value);
                          });
                        },
                      ),
                    ),
                  ),
                  AnimalFormField(
                    labelText: weightHintText,
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    errorText: _weightError,
                    onFieldSubmitted: (value) {
                      setState(() {
                        _weightError = _validateWeight(value);
                      });
                    },
                  ),
                  AnimalFormField(
                    labelText: ownerEmailHintText,
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    errorText: _emailError,
                    onFieldSubmitted: (value) {
                      setState(() {
                        _emailError = _validateEmail(value);
                      });
                    },
                  ),
                  if (selectedIndex == 0 || selectedIndex == 1)
                    const VaccinationForm(),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
          _isLoading
              ? const CircularProgressIndicator()
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SizedBox(
                    height: 56,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _validateForm,
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
