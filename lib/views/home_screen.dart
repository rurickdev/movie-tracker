import 'package:flutter/material.dart';
import 'package:movie_tracker/core/api.dart';
import 'package:movie_tracker/models/movie.dart';
import 'package:movie_tracker/views/movie_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Próximas Películas'),
      ),
      body: FutureBuilder<List<Movie>>(
        future: ApiClient.fetchMovies(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) => MovieCard(
                movie: snapshot.data[index],
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
