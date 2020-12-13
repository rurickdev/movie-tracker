import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:movie_tracker/models/movie.dart';

class ApiClient {
  ApiClient._();

  static const posterUrlBase = 'https://image.tmdb.org/t/p/w300';
  static const urlBase = 'https://api.themoviedb.org/3/movie/upcoming';
  static const apiKey = 'api_key=cb857e7fe789b1d0845a7f5e2802f301';
  static const language = 'language=es-MX';
  static const region = 'region=MX';

  static String getPosterUrl(String posterPath) {
    return '$posterUrlBase$posterPath?$apiKey';
  }

  static Future<List<Movie>> fetchMovies() async {
    final fetchUrl = '$urlBase?$language&$apiKey&$region';
    final response = await http.get(fetchUrl);

    if (response.statusCode == 200) {
      var moviesList = <Movie>[];
      final pages = jsonDecode(response.body)['total_pages'];
      for (int i = 1; i <= pages; i++) {
        final pageResponse = await http.get('$fetchUrl&page=$i');
        final result = jsonDecode(pageResponse.body)['results'];
        final movies = Movie.fromDynamicList(result);
        moviesList.addAll(movies);
      }
      moviesList = moviesList
          .where((movie) => movie.releaseDate.isAfter(DateTime.now()))
          .toList();

      moviesList.sort((movie, nextMovie) =>
          movie.releaseDate.compareTo(nextMovie.releaseDate));

      return moviesList;
    } else {
      throw Exception('Error al obtener las películas');
    }
  }
}
