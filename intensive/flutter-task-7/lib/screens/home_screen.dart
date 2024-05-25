import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:surf_flutter_courses_template/widgets/grid_gallery.dart';

const addPhotoIcon = Icon(Icons.add_a_photo_outlined);
const logoPath = 'assets/logo.png';

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Center(
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(left: 25.0),
                      child: Image(
                        image: AssetImage(logoPath),
                        width: 140.66,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    final ImagePicker picker = ImagePicker();
                    final XFile? image =
                        await picker.pickImage(source: ImageSource.gallery);
                    if (image == null) {
                      return;
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: addPhotoIcon,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: PhotoGrid(),
    );
  }
}