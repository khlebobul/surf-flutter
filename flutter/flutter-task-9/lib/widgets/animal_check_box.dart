import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/constants.dart';
import 'package:surf_flutter_courses_template/ui/colors.dart';
import 'package:surf_flutter_courses_template/ui/fonts.dart';
import 'package:intl/intl.dart';
import 'package:surf_flutter_courses_template/widgets/animals_form.dart';

class VaccinationForm extends StatefulWidget {
  const VaccinationForm({super.key});

  @override
  _VaccinationFormState createState() => _VaccinationFormState();
}

class _VaccinationFormState extends State<VaccinationForm> {
  bool rabies = false;
  bool covid = false;
  bool malaria = false;
  DateTime? lastVaccinationDate;

  TextEditingController rabiesDateController = TextEditingController();
  TextEditingController covidDateController = TextEditingController();
  TextEditingController malariaDateController = TextEditingController();

  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        controller.text = DateFormat('ddMMyyyy').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          vaccinationHeadingText,
          style: AppTextStyles.headlineTextStyle,
        ),
        CustomCheckbox(
          label: vaccinationOneText,
          value: rabies,
          onChanged: (bool? value) {
            setState(() {
              rabies = value!;
            });
          },
        ),
        if (rabies)
          InkWell(
            onTap: () => _selectDate(context, rabiesDateController),
            child: IgnorePointer(
              child: AnimalFormField(
                labelText: lastVaccinationDateText,
                controller: rabiesDateController,
                keyboardType: TextInputType.datetime,
                errorText: null,
              ),
            ),
          ),
        CustomCheckbox(
          label: vaccinationTwoText,
          value: covid,
          onChanged: (bool? value) {
            setState(() {
              covid = value!;
            });
          },
        ),
        if (covid)
          InkWell(
            onTap: () => _selectDate(context, covidDateController),
            child: IgnorePointer(
              child: AnimalFormField(
                labelText: lastVaccinationDateText,
                controller: covidDateController,
                keyboardType: TextInputType.datetime,
                errorText: null,
              ),
            ),
          ),
        CustomCheckbox(
          label: vaccinationThreeText,
          value: malaria,
          onChanged: (bool? value) {
            setState(() {
              malaria = value!;
            });
          },
        ),
        if (malaria)
          InkWell(
            onTap: () => _selectDate(context, malariaDateController),
            child: IgnorePointer(
              child: AnimalFormField(
                labelText: lastVaccinationDateText,
                controller: malariaDateController,
                keyboardType: TextInputType.datetime,
                errorText: null,
              ),
            ),
          ),
        const SizedBox(height: 24),
      ],
    );
  }
}

class CustomCheckbox extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool?> onChanged;

  const CustomCheckbox({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Transform.scale(
          scale: 1.2,
          child: Theme(
            data: ThemeData(),
            child: Checkbox(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              side: BorderSide.none,
              fillColor: value
                  ? WidgetStateProperty.all(AppColors.red)
                  : WidgetStateProperty.all(AppColors.white),
              checkColor: AppColors.white,
              value: value,
              onChanged: onChanged,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              label,
              style: AppTextStyles.checkListTextStyle,
            ),
          ),
        ),
      ],
    );
  }
}
