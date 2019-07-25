import 'package:movie_catalog/model/movie.dart';
import 'package:movie_catalog/repository/movie_repository.dart';

class HomeBloc{
  MovieRepository movieRepository;

  HomeBloc(){
    movieRepository = MovieRepository();
  }

  Future<List<Movie>> getListMovie() async {
    return await movieRepository.getListMovie();        
  }
}