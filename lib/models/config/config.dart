import 'package:hive/hive.dart';

import '../../database/hive.dart' show HiveTypes;
import '../theme/theme.dart';

part 'config.g.dart';

@HiveType(typeId: HiveTypes.configs)
class Configs extends HiveObject {
  @HiveField(0, defaultValue: true)
  bool? isFirstLaunch;
  @HiveField(1, defaultValue: Themes.light)
  Themes? theme;
  @HiveField(2, defaultValue: 'en')
  String? language;

  Configs({
    this.isFirstLaunch,
    this.theme,
    this.language,
  });
}
