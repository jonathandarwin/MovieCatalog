import 'package:movie_catalog/route/api_route.dart';

class BaseRepository{
  ApiRoute apiRoute;

  BaseRepository(){
    apiRoute = ApiRoute();
  }
}