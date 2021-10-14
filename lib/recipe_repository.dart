import 'package:cookbook_app/data/recipe/recipe_database.dart';
import 'data/recipe/recipe.dart';

class RecipeRepository{

 Future<List<Recipe>> getAllRecipe() async {
   final database = await $FloorRecipeDatabase.databaseBuilder('recipe_database.db').build();
   final recipeDao = database.recipeDao;

   return recipeDao.getAllRecipe();
 }
}