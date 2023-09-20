import 'package:hive/hive.dart';

part 'note.g.dart';

@HiveType(typeId: 1)
class Note {
  Note({required this.note});

  @HiveField(0)
  String note;
}
