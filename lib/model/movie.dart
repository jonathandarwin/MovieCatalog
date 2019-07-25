class Movie{
  String title;  
  String poster_path;
  String overview;
  String release_date;
  int vote_average;
  

  Movie({
    this.title,
    this.poster_path,
    this.overview,
    this.release_date
  });

  String getTitle(){
    return title;
  }  

  String getPosterPath(){
    return poster_path;
  }  

  String getOverview(){
    return overview;
  }  

  String getReleaseDate(){
    return release_date;
  }  

  int getVoteAverage(){
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

  Movie setOverview(String overview){
    this.overview = overview;
    return this;
  }

  Movie setReleaseDate(String release_date){
    this.release_date = release_date;
    return this;
  }

  Movie setVoteAverage(int vote_average){
    this.vote_average = vote_average;
    return this;
  }

  factory Movie.fromJson(Map<String, dynamic> json){
    return Movie(
      title: json['title'],
      overview: json['overview'],
      poster_path: json['poster_path'],
      release_date: json['release_date']
    );
  }
}