import 'package:flutter/material.dart';
import '../../models/movie.dart';
import 'movie_detail_screen.dart';

class MovieGridTile extends StatelessWidget {
  const MovieGridTile(
    this.movie, {
    super.key,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: GridTile(
        footer: buildGridFooterBar(context),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              MovieDetailScreen.routeName,
              arguments: movie.id,
            );
          },
          child: Image.network(
            movie.posterUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget buildGridFooterBar(BuildContext context) {
    return GridTileBar(
      backgroundColor: Colors.black87,
      title: Text(
        movie.name,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 15,
        ),
      ),
    );
  }
}
