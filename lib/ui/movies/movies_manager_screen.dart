import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'movies_manager.dart';
import 'movie_list_tile.dart';
import 'edit_movie_screen.dart';

class MoviesManagerScreen extends StatelessWidget {
  static const routeName = '/movies-manager';
  const MoviesManagerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final moviesManager = MoviesManager();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies Manage'),
        actions: <Widget>[
          buildAddButton(context),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async => print('refresh movies'),
        child: buildMovieListView(moviesManager),
      ),
    );
  }

  Widget buildMovieListView(MoviesManager moviesManager) {
    return Consumer<MoviesManager>(builder: (ctx, moviesManager, child) {
      return ListView.builder(
        itemCount: moviesManager.itemCount,
        itemBuilder: (ctx, i) => Column(
          children: [
            MovieListTile(
              moviesManager.items[i],
            ),
          ],
        ),
      );
    });
  }

  Widget buildAddButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.add),
      onPressed: () {
        Navigator.of(context).pushNamed(
          EditMovieScreen.routeName,
        );
      },
    );
  }
}
