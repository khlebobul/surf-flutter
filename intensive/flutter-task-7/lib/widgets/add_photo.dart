import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:surf_flutter_courses_template/api/supabase_auth.dart';

class PhotoUploader {
  static Future<String?> uploadPhoto() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) {
      return null;
    }

    File imageFile = File(image.path);
    List<int> imageData = await imageFile.readAsBytes();

    final response = await Utils.supabaseClient.storage
        .from('photos')
        .upload('photos', imageFile);
    return null;
  }
}
