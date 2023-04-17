import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ui/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MoviesManager(),
        ),
      ],
      child: MaterialApp(
        title: 'Movies Space',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Home(),
        routes: {
          MoviesManagerScreen.routeName: (ctx) => const MoviesManagerScreen(),
        },
        onGenerateRoute: (settings) {
          if (settings.name == MovieDetailScreen.routeName) {
            final movieId = settings.arguments as String;
            return MaterialPageRoute(
              builder: (ctx) {
                return MovieDetailScreen(
                  ctx.read<MoviesManager>().findById(movieId),
                );
              },
            );
          }
          if (settings.name == EditMovieScreen.routeName) {
            final productId = settings.arguments as String?;
            return MaterialPageRoute(
              builder: (ctx) {
                return EditMovieScreen(
                  productId != null
                      ? ctx.read<MoviesManager>().findById(productId)
                      : null,
                );
              },
            );
          }
          return null;
        },
      ),
    );
  }
}
