import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/widgets/add_photo.dart';
import 'package:surf_flutter_courses_template/widgets/grid_gallery.dart';

const logoPath = 'assets/logo.png';

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
  });

  Future<void> _pickImage(BuildContext context) async {
    String? photoUrl = await PhotoUploader.uploadPhoto();
    if (photoUrl != null) {
      await savePhotoUrlToDatabase(photoUrl);
    }
  }

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
                  onTap: () => _pickImage(context),
                  child: const Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Icon(Icons.add_a_photo_outlined),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: const PhotoGrid(),
    );
  }
}

savePhotoUrlToDatabase(String photoUrl) {}
