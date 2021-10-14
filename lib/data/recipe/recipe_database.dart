import 'dart:async';
import 'package:cookbook_app/data/component/component.dart';
import 'package:cookbook_app/data/recipe/recipe_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'package:cookbook_app/data/recipe/recipe.dart';
import 'package:floor/floor.dart';

part 'recipe_database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [Recipe])
abstract class RecipeDatabase extends FloorDatabase {
  RecipeDao get recipeDao;
}