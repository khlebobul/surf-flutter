import 'package:surf_flutter_courses_template/domain/app_theme.dart';
// DataSource для получения возможных тем приложения
class ThemesDataSource {
  List<AppTheme> get themes => [
        SystemTheme(),
        LightGreenTheme(),
        LightBlueTheme(),
        LightOrangeTheme(),
        DarkGreenTheme(),
        DarkBlueTheme(),
        DarkOrangeTheme()
      ];
}
