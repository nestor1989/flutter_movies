import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import '../model/Movie.dart';

class CardSwipper extends StatelessWidget {
  final List<Movie> movies;

  const CardSwipper({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
        width: double.infinity,
        height: size.height * 0.5,
        child: Swiper(
          itemCount: movies.length,
          layout: SwiperLayout.STACK,
          itemHeight: size.height * 0.4,
          itemWidth: size.width * 0.6,
          itemBuilder: (_, int index) {
            final movie = movies[index];
            return GestureDetector(
              onTap: (() => Navigator.pushNamed(context, 'details',
                  arguments: movie.title)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  image: NetworkImage(movie.fullPosterImg),
                  placeholder: AssetImage('assets/no-image.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ));
  }
}
