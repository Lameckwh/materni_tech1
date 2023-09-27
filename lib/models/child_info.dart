import 'package:hive/hive.dart';

part 'child_info.g.dart';

@HiveType(typeId: 2)
class ChildInfo {
  ChildInfo({
    required this.days,
    required this.months,
    required this.years,
    required this.dateOfBirth,
  });

  @HiveField(0)
  int days;

  @HiveField(1)
  int months;

  @HiveField(2)
  int years;

  @HiveField(3)
  DateTime dateOfBirth;
}
