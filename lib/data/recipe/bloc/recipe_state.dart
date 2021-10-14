part of 'recipe_bloc.dart';

abstract class RecipeState{
  final List<Recipe> elements;
  RecipeState(this.elements);
}

class RecipeInitial extends RecipeState {
  RecipeInitial(List<Recipe>elements) : super(elements);
}

class RecipeLoadingInProgress extends RecipeState{
  RecipeLoadingInProgress(List<Recipe> elements) : super(elements);
}

class RecipeLoadingSuccess extends RecipeState{
  RecipeLoadingSuccess(List<Recipe> elements) : super(elements);
}

class RecipeError extends RecipeState{
  RecipeError(List<Recipe> elements) : super(elements);
}