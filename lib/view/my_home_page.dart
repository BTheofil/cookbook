import 'package:cookbook_app/data/recipe/bloc/recipe_bloc.dart';
import 'package:cookbook_app/data/recipe/recipe.dart';
import 'package:cookbook_app/view/recipe_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Recipe> recipes = List.empty();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<RecipeBloc>(context).add(LoadAll(recipes));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder<RecipeBloc, RecipeState>(
        builder: (context, state){
          if(state is RecipeLoadingSuccess){
            ListView.builder(
                itemCount: recipes.length,
                itemBuilder: (BuildContext context, int index){
                  return GestureDetector(
                    onTap: (){

                    },
                      child: RecipeTileWidget(recipes[index])
                  );
                }
            );
          }else if(state is RecipeError){
            return Text("qwe");
          }
          return Container();
        },
      )
    );
  }
}

