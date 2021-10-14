import 'package:cookbook_app/data/recipe/recipe.dart';
import 'package:floor/floor.dart';

@Entity(
  foreignKeys: [
    ForeignKey(childColumns: ['belongTo'],
        parentColumns: ['title'],
        entity: Recipe)
  ]
)
class Component{
  @PrimaryKey(autoGenerate: true)
  int? id;
  String name;
  String belongTo;

  Component({
    this.id,
    required this.name,
    required this.belongTo
  });
}