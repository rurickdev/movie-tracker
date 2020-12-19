import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie_tracker/core/api.dart';
import 'package:movie_tracker/models/movie.dart';

class MovieModal extends StatelessWidget {
  MovieModal({
    this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final imageHeight = 200.0;
    final imageWidth = imageHeight * 0.66;

    return Container(
      padding: EdgeInsets.all(25),
      height: movie.overview.isNotEmpty ? null : 300,
      child: Column(
        children: [
          Row(
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
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        movie.title,
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          Icon(Icons.calendar_today),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            movie.formatDate,
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          Icon(Icons.star_half),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            movie.voteAverage.toString(),
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          Icon(Icons.thumb_up),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            movie.popularity.toString(),
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          if (movie.overview.isNotEmpty)
            Expanded(
              child: Text(
                movie.overview,
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.justify,
                maxLines: 10,
                overflow: TextOverflow.ellipsis,
              ),
            ),
        ],
      ),
    );
  }
}
