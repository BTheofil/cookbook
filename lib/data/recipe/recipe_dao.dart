import 'package:cookbook_app/data/component/component.dart';
import 'package:cookbook_app/data/recipe/recipe.dart';
import 'package:floor/floor.dart';

@dao
abstract class RecipeDao {
  @Query('SELECT * FROM Recipe')
  Future<List<Recipe>> getAllRecipe();

  @Query('SELECT * FROM Recipe WHERE id = :id')
  Future<Recipe?> getRecipe(int id);

  @Query("DELETE FROM Recipe WHERE id = :id")
  Future<void> deleteRecipe(int id);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> upsertRecipe(Recipe recipe);

  @Query('SELECT Component.name FROM Component, Recipe WHERE belongTo = :title')
  Future<List<Component>?> getAllComponentByRecipeTitle(String title);
}