import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/movie.dart';
import 'movies_manager.dart';
import 'movie_detail_screen.dart';
import 'edit_movie_screen.dart';

class MovieListTile extends StatelessWidget {
  final Movie movie;

  const MovieListTile(
    this.movie, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(movie.name),
        subtitle: Text('${movie.nation} (${movie.year})'),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(movie.posterUrl),
        ),
        trailing: SizedBox(
          width: 100,
          child: Row(
            children: <Widget>[
              buildEditButton(context),
              buildDeleteButton(context),
            ],
          ),
        ),
        onTap: () {
          Navigator.of(context).pushNamed(
            MovieDetailScreen.routeName,
            arguments: movie.id,
          );
        },
      ),
    );
  }

  Widget buildDeleteButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.delete),
      onPressed: () {
        context.read<MoviesManager>().deleteMovie(movie.id!);
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Text(
                '${movie.name} is deleted',
                textAlign: TextAlign.center,
              ),
            ),
          );
      },
      color: Theme.of(context).errorColor,
    );
  }

  Widget buildEditButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.edit),
      onPressed: () {
        Navigator.of(context).pushNamed(
          EditMovieScreen.routeName,
          arguments: movie.id,
        );
      },
      color: Theme.of(context).primaryColor,
    );
  }
}
