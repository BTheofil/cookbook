import 'package:floor/floor.dart';

@entity
class Recipe{
  @PrimaryKey(autoGenerate: true)
  int? id;
  String title;
  String howToMake;

  Recipe({
  this.id,
    required this.title,
    required this.howToMake,
  });
}