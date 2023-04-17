import 'package:flutter/material.dart';
import 'package:flutter_movies/providers/movies_provider.dart';
import 'package:flutter_movies/widgets/card_swiper.dart';
import 'package:flutter_movies/widgets/movie_slider.dart';
import 'package:provider/provider.dart';
import '../providers/movies_provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Grandes Estrenos', textAlign: TextAlign.center),
          elevation: 0,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search_rounded))
          ],
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            CardSwipper(movies: moviesProvider.onDisplayMovies),
            MovieSlider()
          ],
        )));
  }
}
