import 'package:cookbook_app/data/component/component.dart';
import 'package:floor/floor.dart';

@dao
abstract class ComponentDao {
  @Query('SELECT * FROM Component')
  Future<List<Component>> getAllRecipe();

  @Query('SELECT * FROM Component WHERE id = :id')
  Future<Component?> getRecipe(int id);

  @Query("DELETE FROM Component WHERE id = :id")
  Future<void> deleteRecipe(int id);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> upsertRecipe(Component component);
}