import 'package:surf_flutter_courses_template/api/supabase_auth.dart';
import '../uikit/constants.dart';
import 'package:supabase/supabase.dart';

class PhotoService {
  Future<List<String>> fetchPhotos() async {
    final response = await Utils.supabaseClient.storage.from('photos').list();

    List<String> photoUrls = [];
    for (final file in response) {
      final url =
          Utils.supabaseClient.storage.from('photos').getPublicUrl(file.name);
      photoUrls.add(url);
    }
    return photoUrls;
  }
}
