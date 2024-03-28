import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:surf_flutter_courses_template/values/colors.dart';
import 'package:surf_flutter_courses_template/values/font.dart';

class ThemeModal extends StatelessWidget {
  const ThemeModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 352,
      child: Column(
        children: [
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Тема оформления', style: headingFont),
                IconButton(
                  icon: SvgPicture.asset('assets/icons/close.svg'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          const RadioTile(title: 'Системная'),
          const RadioTile(title: 'Светлая'),
          const RadioTile(title: 'Темная'),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: readyButtonLightColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  )),
              child: SizedBox(
                  width: 335,
                  height: 48,
                  child: Center(child: Text('Готово', style: readyButtonFont))),
            ),
          ),
        ],
      ),
    );
  }
}

class RadioTile extends StatefulWidget {
  final String title;

  const RadioTile({Key? key, required this.title}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RadioTileState createState() => _RadioTileState();
}

class _RadioTileState extends State<RadioTile> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: RadioListTile(
        title: Text(widget.title),
        value: widget.title,
        groupValue: isSelected ? widget.title : null,
        onChanged: (newValue) {
          setState(() {
            isSelected = true;
          });
        },
      ),
    );
  }
}
