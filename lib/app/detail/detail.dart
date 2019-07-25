import 'package:flutter/material.dart';
import 'package:movie_catalog/model/movie.dart';
import 'package:movie_catalog/route/api_route.dart';
import 'package:transparent_image/transparent_image.dart';

class DetailLayout extends StatelessWidget{
  final Movie movie;

  DetailLayout(this.movie);

  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[  
              // IMAGE          
              Stack(              
                children: <Widget>[
                  BackDropLayout(movie.getBackdropPath()),            
                  PosterLayout(movie.getPosterPath())
                ],
              ),                
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Align(              
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: <Widget>[
                      // TITLE
                      Title(movie.getTitle()),
                      Rating(movie.getVoteAverage()),
                      Overview(movie.getOverview())
                    ],
                  ),
                ),
              ),                 
            ],
          ),
        ),     
      ),
    );
  }
}

class BackDropLayout extends StatelessWidget{
  final String path;  

  BackDropLayout(this.path);

  @override
  Widget build(BuildContext context){
    var size = MediaQuery.of(context).size;

    final double itemHeight = size.height / 3;
    final double itemWidth = size.width;

    return Padding(
      padding: EdgeInsets.only(bottom: 70.0),
      child: FadeInImage.memoryNetwork(      
        placeholder: kTransparentImage,
        fadeInDuration: Duration(seconds: 1),
        fadeInCurve: Curves.bounceIn,                        
        height: itemHeight,
        width: itemWidth,
        fit: BoxFit.fill,      
        image : ApiRoute.BASE_IMAGE + path
      ),
    );
  }
}

class PosterLayout extends StatelessWidget{
  final String path;

  PosterLayout(this.path);

  Widget build(BuildContext context){
    var size = MediaQuery.of(context).size;

    final double itemHeight = size.height / 5;
    final double itemWidth = size.width / 4;

    return Positioned(
      left: 20.0,
      bottom: 0.0,      
      child: Hero(
        tag: 'image$path',
        child: FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,        
          fadeInDuration: Duration(seconds: 1),
          fadeInCurve: Curves.bounceIn,                        
          height: itemHeight,
          fit: BoxFit.fill,
          width: itemWidth,
          image : ApiRoute.BASE_IMAGE + path
        ),
      )
    );
  }
}

class Title extends StatelessWidget{
  final String title;

  Title(this.title);

  Widget build(BuildContext context){
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0
        ),
      ),
    );
  }
}

class Rating extends StatelessWidget{
  final String rating;

  Rating(this.rating);

  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text('Rating : $rating / 10.0',
          style: TextStyle(
            color: Colors.grey
          ),
        ),
      ),
    );
  }
}

class Overview extends StatelessWidget{
  final String overview;

  Overview(this.overview);

  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(overview + 'aksdjflk sajlkdfjaslkdfjlksajdlfkjsadlkfjlsadjfl as jdfljsadlkf jalksd jfldsajf lkasjdflk js aksdjflk sajlkdfjaslkdfjlksajdlfkjsadlkfjlsadjfl as jdfljsadlkf jalksd jfldsajf lkasjdflk jsaksdjflk sajlkdfjaslkdfjlksajdlfkjsadlkfjlsadjfl as jdfljsadlkf jalksd jfldsajf lkasjdflk jsaksdjflk sajlkdfjaslkdfjlksajdlfkjsadlkfjlsadjfl as jdfljsadlkf jalksd jfldsajf lkasjdflk jsaksdjflk sajlkdfjaslkdfjlksajdlfkjsadlkfjlsadjfl as jdfljsadlkf jalksd jfldsajf lkasjdflk js',
          style: TextStyle(
            color: Colors.grey
          ),
        ),
      ),
    );
  }
}