import 'package:flutter/material.dart';
import '../../models/movie.dart';
import 'package:provider/provider.dart';
import 'movies_manager.dart';

class MovieDetailScreen extends StatefulWidget {
  static const routeName = '/movie-detail';
  const MovieDetailScreen(
    this.movie, {
    super.key,
  });

  final Movie movie;

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movie.name),
        actions: [
          buildFavoriteIcon(),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          SizedBox(
            child: Image.network(widget.movie.posterUrl),
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
          Text(
            widget.movie.name,
            style: const TextStyle(
              color: Colors.blueAccent,
              fontSize: 25,
            ),
            textAlign: TextAlign.center,
            softWrap: true,
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Quốc gia: ${widget.movie.nation}',
            style: const TextStyle(
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            'Thể loại: ${widget.movie.genre}',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          Text(
            'Năm sản xuất: ${widget.movie.year}',
            style: const TextStyle(
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.movie.description,
            style: const TextStyle(
              fontSize: 18,
            ),
            textAlign: TextAlign.justify,
            softWrap: true,
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.play_arrow_outlined),
        onPressed: () {
          print('Play video');
        },
      ),
    );
  }

  Widget buildFavoriteIcon() {
    return ValueListenableBuilder<bool>(
      valueListenable: widget.movie.isFavoriteListenable,
      builder: (ctx, isFavorite, child) {
        return IconButton(
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
          ),
          // color: Theme.of(context).colorScheme.secondary,
          onPressed: () {
            ctx.read<MoviesManager>().toggleFavoriteStatus(widget.movie);
          },
        );
      },
    );
  }
}
