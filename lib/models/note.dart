import 'package:hive/hive.dart';

part 'note.g.dart';

@HiveType(typeId: 0)
class Note {
  Note({required this.note, required this.date});

  @HiveField(0)
  String note;

  @HiveField(1)
  String date;
}
