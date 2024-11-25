class Movie {
  String title;
  String backDropPath;
  String originalTitle;
  String overview;
  String posterPath;
  String releaseDate;
  double voteAverage;

  Movie({
    required this.title,
    required this.backDropPath,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json["title"],
      backDropPath: json["backdrop_path"],
      originalTitle: json["original_title"],
      overview: json["overview"],
      posterPath: json["poster_path"],
      releaseDate: json["release_date"],
      voteAverage: json["vote_average"].toDouble(),
    );
  }
}

class Serie {
  String backDropPath;
  String originalLanguage;
  String originalName;
  String overview;
  String posterPath;
  String firstAirDate;
  double voteAverage;

  Serie({
    required this.backDropPath,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.posterPath,
    required this.firstAirDate,
    required this.voteAverage,
  });

  factory Serie.fromJson(Map<String, dynamic> json) {
    return Serie(
      backDropPath: json["backdrop_path"] ?? "",
      originalLanguage: json["original_language"] ?? "Unknown",
      originalName: json["original_name"] ?? json["name"] ?? "No Name",
      overview: json["overview"] ?? "No Overview Available",
      posterPath: json["poster_path"] ?? "",
      firstAirDate: json["first_air_date"] ?? "Unknown",
      voteAverage: json["vote_average"].toDouble(),
    );
  }
}
