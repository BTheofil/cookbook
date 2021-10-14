import 'package:cookbook_app/data/recipe/recipe.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecipeTileWidget extends StatelessWidget{

  final Recipe recipe;

  RecipeTileWidget(this.recipe);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: <Widget>[
          Icon(Icons.add_photo_alternate_rounded),
          Text(recipe.title),
        ],
      ),
    );
  }
}