import 'package:hive/hive.dart';
part 'favorite_tip.g.dart';

@HiveType(typeId: 3)
class FavoriteTip {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String description;

  FavoriteTip(this.title, this.description);
}
