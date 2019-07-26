import 'dart:convert';

import 'package:movie_catalog/model/movie.dart';
import 'package:http/http.dart';
import 'package:movie_catalog/route/api_route.dart';

class MovieRepository {

  Future<List<Movie>> getListMovie() async {        
    List<Movie> listMovie = List<Movie>();
    Response response = await get(ApiRoute.GET_LIST_MOVIE);   

    if(response.statusCode == 200) {      
      Iterable list = json.decode(response.body)['results'];                        
      listMovie = list.map((model) => Movie.fromJson(model)).toList();            
    }    
    return listMovie;
  }
}