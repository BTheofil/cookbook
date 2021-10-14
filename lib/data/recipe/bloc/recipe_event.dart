part of 'recipe_bloc.dart';

abstract class RecipeEvent extends Equatable{
  final List<Recipe> elements;
  const RecipeEvent(this.elements);
}

class LoadAll extends RecipeEvent{
  const LoadAll(List<Recipe> elements) : super(elements);

  @override
  List<Object> get props => [];
}