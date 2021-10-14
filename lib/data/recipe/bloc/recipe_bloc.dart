import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cookbook_app/data/recipe/recipe.dart';
import 'package:cookbook_app/recipe_repository.dart';
import 'package:equatable/equatable.dart';

part 'recipe_event.dart';

part 'recipe_state.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  final RecipeRepository _repository = RecipeRepository();

  RecipeBloc() : super(RecipeInitial(List.empty())) {
    add(LoadAll(List.empty()));
  }

  @override
  Stream<RecipeState> mapEventToState(RecipeEvent event) async* {
    if (event is LoadAll) {
      yield RecipeLoadingInProgress(event.elements);
      yield await loadAll();
    }
  }

  Future<RecipeState> loadAll() async {
    final elements = await _repository.getAllRecipe();
    if (elements.isNotEmpty) {
      return RecipeLoadingSuccess(elements);
    } else {
      return RecipeError(List.empty());
    }
  }
}
