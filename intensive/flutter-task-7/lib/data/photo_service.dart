import 'package:surf_flutter_courses_template/api/supabase_auth.dart';

import '../uikit/constants.dart';

class PhotoService {
  Future<List<String>> fetchPhotos() async {
    final response =
        await Utils.supabaseClient.from(DbConstants.photoTable).select(DbConstants.imagePath);

    List<String> photoUrls = [];
    for (final row in response) {
      photoUrls.add(row[DbConstants.imagePath] as String);
    }
    return photoUrls;
  }
}