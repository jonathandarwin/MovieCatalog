import 'package:flutter/material.dart';
import 'package:movie_catalog/app/splash/splash.dart';

void main() => runApp(Main());

class Main extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Movie Catalog",
      home: SafeArea(
        child: SplashLayout(), 
      ),
    );
  }
}

