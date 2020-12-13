import 'package:intl/intl.dart';

class Movie {
  Movie({
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.voteAverage,
  });

  final String overview;
  final double popularity;
  final String posterPath;
  final DateTime releaseDate;
  final String title;
  final double voteAverage;

  String get formatDate {
    final formatter = DateFormat('dd MMM yyyy');
    return formatter.format(releaseDate).toString();
  }

  static List<Movie> fromDynamicList(List<dynamic> list) {
    return list.map<Movie>((movieJson) => fromJson(movieJson)).toList();
  }

  static Movie fromJson(dynamic json) {
    return Movie(
      overview: json['overview'],
      popularity: json['popularity'],
      posterPath: json['poster_path'],
      releaseDate: DateTime.tryParse(json['release_date']),
      title: json['title'],
      voteAverage: double.tryParse(json['vote_average'].toString()),
    );
  }
}
