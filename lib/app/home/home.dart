import 'package:flutter/material.dart';
import 'package:movie_catalog/app/detail/detail.dart';
import 'package:movie_catalog/app/home/home_bloc.dart';
import 'package:movie_catalog/model/movie.dart';
import 'package:movie_catalog/route/api_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeLayout extends StatelessWidget{
  final HomeBloc _bloc = HomeBloc();

  @override
  Widget build(BuildContext context){        
    return SafeArea(
        child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // TITLE
              Container(
                child: Title(),
              ),
              // DIVIDER
              Container(
                child: CustomDivider(),
              ),
              // LIST                            
              Expanded(                
                child: FutureBuilder(
                  future: _bloc.getListMovie(),
                  initialData: null,
                  builder: (context, snapshot){                                        
                    if(snapshot.data != null){
                      List<Movie> listMovie = snapshot.data;                      
                      if(listMovie.length != 0){                                                
                        return MovieGridViewItem(listMovie);
                      }
                      else{                        
                        return NoData();
                      }
                    }
                    else{
                      return Loader();
                    }
                  },
                ),
              )                 
            ],
          )
        ),             
      ),
    );
  }  
}

class Title extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Hero(
      tag: 'title',
      child: Image.asset('assets/logo.png')
    );
  }
}

class CustomDivider extends StatelessWidget{
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.all(5.0),
      child: Divider(        
        color: Colors.black,
      ),
    );
  }
}

class Loader extends StatelessWidget{
  Widget build(BuildContext context){
    return Container(
      child: Center(
        child: Text('Loading...'),
      ),
    );
  }
}

class NoData extends StatelessWidget{
  Widget build(BuildContext context){
    return Container(
      child: Center(
        child: Text('No Data'),
      ),
    );
  }
}

class MovieGridViewItem extends StatelessWidget{
  final List<Movie> listMovie;

  MovieGridViewItem(this.listMovie);

  Widget build(BuildContext context){   
    var size = MediaQuery.of(context).size;
    
    final double itemHeight = size.height / 2;
    final double itemWidth = size.width / 2;

    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: (itemWidth / itemHeight),
      children: List.generate(listMovie.length, (i){
        Movie movie = listMovie[i];
        return GestureDetector(
          onTap: () => gotoDetail(context, movie),
          child: Container(
            margin: EdgeInsets.all(10.0),          
            child: Material(
              elevation: 10.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // IMAGE
                  Hero(
                    tag: 'image${movie.getPosterPath()}',
                    child:FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      fadeInDuration: Duration(seconds: 1),
                      fadeInCurve: Curves.bounceIn,                  
                      image : ApiRoute.BASE_IMAGE + movie.getPosterPath()
                    )
                  ),
                  // TITLE
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: AutoSizeText(movie.getTitle(), maxLines: 2,),
                  )
                ],
              ),
            )
          ),
        );
      })
    );
  }

  void gotoDetail(BuildContext context, Movie movie){
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, duration){
          return DetailLayout(movie);
        },
        transitionDuration: Duration(seconds: 1)
      )
    );
  }
}