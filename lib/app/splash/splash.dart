import 'package:flutter/material.dart';
import 'dart:async';
import 'package:movie_catalog/app/home/home.dart';

class SplashLayout extends StatelessWidget{  
  @override
  Widget build(BuildContext context){                    
    Future.delayed(Duration(milliseconds: 1500), () => gotoHome(context));

    return Scaffold(      
      body: Material(           
        child: Center(
          child: Hero(            
            tag: 'title',
            child: Image.asset('assets/logo.png')
          ),
        )
      )             
    );
  }
}

void gotoHome(BuildContext context){  
  Navigator.of(context).push(PageRouteBuilder(
    pageBuilder: (context, animation, duration) {
      return HomeLayout();
    },
    transitionDuration: Duration(seconds: 2)
  ));
}