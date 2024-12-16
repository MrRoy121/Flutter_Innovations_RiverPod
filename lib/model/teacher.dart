import 'package:isar/isar.dart';
import 'course.dart';

part 'teacher.g.dart';

@Collection()
class Teacher {
  Id id = Isar.autoIncrement;
  late String name;
  final course = IsarLink<Course>();
}