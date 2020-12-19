import 'package:flutter/material.dart';
import 'package:movie_tracker/core/api.dart';
import 'package:movie_tracker/models/movie.dart';
import 'package:movie_tracker/views/movie_modal.dart';

class MovieCard extends StatelessWidget {
  MovieCard({
    this.movie,
  });

  final Movie movie;

  String _buildRemainingDays(DateTime date) {
    final remainingTime = date.difference(DateTime.now()).inDays;

    return 'Faltan $remainingTime días';
  }

  @override
  Widget build(BuildContext context) {
    final imageHeight = 125.0;
    final imageWidth = imageHeight * 0.66;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      child: Card(
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: () {
            showModalBottomSheet(
              context: context,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(26),
                ),
              ),
              builder: (context) {
                return MovieModal(
                  movie: movie,
                );
              },
            );
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (movie.posterPath != null)
                Image.network(
                  ApiClient.getPosterUrl(
                    movie.posterPath,
                  ),
                  height: imageHeight,
                  width: imageWidth,
                  fit: BoxFit.fitHeight,
                )
              else
                Container(
                  height: imageHeight,
                  width: imageWidth,
                  color: Colors.black12,
                  child: Icon(
                    Icons.movie_filter,
                    size: 50,
                    color: Colors.black38,
                  ),
                ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 18,
                    horizontal: 12,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        movie.title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      Text(
                        _buildRemainingDays(movie.releaseDate),
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
