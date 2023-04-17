import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'movies_manager.dart';
import 'movie_grid_tile.dart';
import '../../models/movie.dart';

class MoviesGrid extends StatelessWidget {
  final bool showFavorites;

  const MoviesGrid(this.showFavorites, {super.key});

  @override
  Widget build(BuildContext context) {
    // Đọc ra danh sách các movie
    final movies = context.select<MoviesManager, List<Movie>>((moviesManager) =>
        showFavorites ? moviesManager.favoriteItems : moviesManager.items);
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: movies.length,
      itemBuilder: (ctx, i) => MovieGridTile(movies[i]),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
