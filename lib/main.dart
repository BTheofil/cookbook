import 'package:cookbook_app/data/recipe/bloc/recipe_bloc.dart';
import 'package:cookbook_app/view/my_home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => RecipeBloc(),
        child: MyHomePage(title: 'Home'),
      ),
    );
  }
}


