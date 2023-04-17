import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'movies_manager.dart';
import 'movie_grid_tile.dart';
import '../../models/movie.dart';

class SearchResult extends StatelessWidget {
  final String _searchQuery;
  final bool _showOnlyFavorites;

  const SearchResult(this._searchQuery, this._showOnlyFavorites, {super.key});

  @override
  Widget build(BuildContext context) {
    // Đọc ra danh sách các movie
    final movies = _showOnlyFavorites
        ? context.select<MoviesManager, List<Movie>>((moviesManager) =>
            moviesManager.findFavoriteByString(
                _searchQuery, _showOnlyFavorites))
        : context.select<MoviesManager, List<Movie>>(
            (moviesManager) => moviesManager.findByString(_searchQuery));
    if (movies.isEmpty) {
      return const Center(
        child: Text('No Results Found'),
      );
    } else {
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
}
