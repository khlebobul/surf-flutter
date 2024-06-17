import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:surf_flutter_courses_template/widgets/add_photo.dart';
import 'dart:typed_data';
import 'package:surf_flutter_courses_template/widgets/grid_gallery.dart';

const logoPath = 'assets/logo.png';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Uint8List> _localImages = [];

  Future<void> _pickImage(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final Uint8List imageBytes = await pickedFile.readAsBytes();

      setState(() {
        _localImages.add(imageBytes);
      });

      String? photoUrl = await PhotoUploader.uploadPhoto(pickedFile);
      if (photoUrl != null) {
        await savePhotoUrlToDatabase(photoUrl);
      }
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
      body: PhotoGrid(localImages: _localImages),
    );
  }
}

savePhotoUrlToDatabase(String photoUrl) {}
