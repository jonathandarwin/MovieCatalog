class Movie{
  String title;  
  String poster_path;
  String backdrop_path;
  String overview;
  String release_date;
  String vote_average;
  

  Movie({
    this.title,
    this.poster_path,
    this.backdrop_path,
    this.overview,
    this.release_date,
    this.vote_average
  });

  String getTitle(){
    return title;
  }  

  String getPosterPath(){
    return poster_path;
  }  

  String getBackdropPath(){
    return backdrop_path;
  }

  String getOverview(){
    return overview;
  }  

  String getReleaseDate(){
    return release_date;
  }  

  String getVoteAverage(){
    return vote_average;
  }  

  Movie setTitle(String title){
    this.title = title;
    return this;
  }

  Movie setPosterPath(String poster_path){
    this.poster_path = poster_path;
    return this;
  }

  Movie setBackdropPath(String backdrop_path){
    this.backdrop_path = backdrop_path;
    return this;
  }

  Movie setOverview(String overview){
    this.overview = overview;
    return this;
  }

  Movie setReleaseDate(String release_date){
    this.release_date = release_date;
    return this;
  }

  Movie setVoteAverage(String vote_average){
    this.vote_average = vote_average;    
    return this;
  }

  factory Movie.fromJson(Map<String, dynamic> json){
    return Movie(
      title: json['title'],
      overview: json['overview'],
      poster_path: json['poster_path'],
      backdrop_path : json['backdrop_path'],
      release_date: json['release_date'],
      vote_average: json['vote_average'].toString()
    );
  }
}