import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_test/models/movie.dart';
import 'package:mobile_test/pages/movies/bloc/bloc.dart';
import 'package:mobile_test/theme/colors.dart';

class Test1Page extends StatelessWidget {
  const Test1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text('Test #1'),
      ),
      body: BlocBuilder<Test2Bloc, Test2State>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            itemCount: state.model.movies.length,
            itemBuilder: (context, i) {
              final movie = state.model.movies[i];
              return _movie(context: context, movie: movie);
            },
          );
        },
      ),
    );
  }

  Widget _movie({required BuildContext context, required Movie movie}) {
    return FadeInLeft(
      duration: const Duration(milliseconds: 500),
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 10.0,
              color: Colors.black12,
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16.0),
                bottomLeft: Radius.circular(16.0),
              ),
              child: Image.network(
                'http://image.tmdb.org/t/p/w500/${movie.posterPath}',
                width: 100.0,
              ),
            ),
            const SizedBox(width: 10.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8.0),
                  Text(
                    movie.title ?? '',
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      color: Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      letterSpacing: -0.16,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    movie.originalTitle ?? '',
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      color: Color(0xff272727),
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      letterSpacing: -0.14,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  _StarRating(rating: movie.raiting),
                  const SizedBox(height: 10.0),
                  Text(
                    movie.overview ?? '',
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      color: Color(0xff272727),
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      letterSpacing: -0.1,
                    ),
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StarRating extends StatelessWidget {
  final int rating;
  const _StarRating({
    Key? key,
    this.rating = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const space = SizedBox(width: 10.0);
    const color = Colors.yellow;
    const starSize = 20.0;

    const _full = Icon(Icons.star, color: color, size: starSize);
    const _half = Icon(Icons.star_half, color: color, size: starSize);
    const _empty = Icon(Icons.star_border, color: color, size: starSize);

    Icon chooseStar(int index) => (rating >= index + 1)
        ? _full
        : (rating >= index + 0.5)
            ? _half
            : _empty;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        for (int i = 0; i < 5; i++) ...[
          if (i > 0) space,
          chooseStar(i),
        ]
      ],
    );
  }
}
