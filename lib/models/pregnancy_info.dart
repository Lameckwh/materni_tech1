import 'package:hive/hive.dart';

part 'pregnancy_info.g.dart';

@HiveType(typeId: 1)
class PregnancyInfo {
  PregnancyInfo({
    required this.days,
    required this.weeks,
    required this.deliveryDate,
  });

  @HiveField(0)
  String days;

  @HiveField(1)
  int weeks;

  @HiveField(2)
  String deliveryDate;
}
