import 'dart:typed_data';
import 'package:supabase/supabase.dart';
import 'package:image_picker/image_picker.dart';
import '../uikit/constants.dart';

class PhotoService {
  final SupabaseClient supabaseClient;

  PhotoService(this.supabaseClient);

  Future<List<Uint8List>> fetchPhotos() async {
    final response =
        await supabaseClient.from(DbConstants.photoTable).select(DbConstants.imagePath);

    List<Uint8List> photoBlobs = [];
    for (final row in response) {
      final byteData = await supabaseClient
          .storage
          .from('your-bucket-name')
          .download(row[DbConstants.imagePath] as String);
      photoBlobs.add(byteData);
    }
    return photoBlobs;
  }

  Future<void> uploadPhoto() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) {
      return;
    }
    Uint8List bytes = await image.readAsBytes();

    final filePath = 'path/to/upload/${image.name}';
    await supabaseClient.storage.from('your-bucket-name').uploadBinary(filePath, bytes);

    await supabaseClient.from(DbConstants.photoTable).insert({
      DbConstants.imagePath: filePath,
    });
  }
}
