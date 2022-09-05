import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_test/models/movie.dart';
import 'package:mobile_test/pages/detail/bloc/bloc.dart';
import 'package:mobile_test/pages/home/bloc/bloc.dart';
import 'package:mobile_test/theme/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text('Que deseas ver'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0).copyWith(top: 0.0),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            const HeaderWidget(text: 'Peliculas populares'),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<Test1Bloc, Test1State>(
              builder: (context, state) {
                return SizedBox(
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics(),
                    ),
                    itemCount: state.model.popular.length,
                    itemBuilder: (context, i) {
                      final movie = state.model.popular[i];
                      return ContentMovie(movie: movie);
                    },
                  ),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const HeaderWidget(text: 'Peliculas taquilleras'),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<Test1Bloc, Test1State>(
              builder: (context, state) {
                return SizedBox(
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics(),
                    ),
                    itemCount: state.model.tops.length,
                    itemBuilder: (context, i) {
                      final movie = state.model.tops[i];
                      return ContentMovie(movie: movie);
                    },
                  ),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const _Button(
              title: 'Ver todas las peliculas',
              route: '/general',
            ),
          ],
        ),
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  final String text;
  const HeaderWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 16, color: AppColors.primary),
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/test'),
            child: const Text(
              'Ver todos',
            ),
          ),
        ],
      ),
    );
  }
}

class ContentMovie extends StatelessWidget {
  final Movie movie;
  const ContentMovie({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<Test3Bloc>().getMovie(movieId: movie.id ?? 0);
        Navigator.pushNamed(context, '/detail');
      },
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            'http://image.tmdb.org/t/p/w500/${movie.posterPath}',
          ),
        ),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  final String title;
  final String route;

  const _Button({
    Key? key,
    required this.title,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontFamily: 'Inter',
                color: Color(0xffffffff),
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal,
                letterSpacing: -0.16,
              ),
            ),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColors.secondary),
          padding: MaterialStateProperty.all(const EdgeInsets.all(20.0)),
          shape: MaterialStateProperty.all(const StadiumBorder()),
        ),
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
      ),
    );
  }
}
