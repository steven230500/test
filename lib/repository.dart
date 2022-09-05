import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mobile_test/models/movie.dart';

class Repository {
  final dio = Dio()
    ..options.headers = {
      Headers.contentTypeHeader: Headers.jsonContentType,
      Headers.acceptHeader: Headers.jsonContentType,
      HttpHeaders.acceptEncodingHeader: 'gzip',
    };

  Future<List<Movie>> getMovies({required String filter}) async {
    final url =
        'https://api.themoviedb.org/3/movie/$filter?api_key=34738023d27013e6d1b995443764da44&language=es&page=1';

    final response = await dio.get(url);
    final data = response.data['results'] as List<dynamic>;
    final List<Movie> movies = [];
    for (final movie in data) {
      movies.add(Movie.fromJson(movie));
    }
    log('eche $movies');
    return movies;
  }

  Future<Movie> getMovie({required int movieId}) async {
    final url =
        'https://api.themoviedb.org/3/movie/$movieId?api_key=34738023d27013e6d1b995443764da44&language=es&page=1';

    final response = await dio.get(url);
    final data = response.data['results'] as dynamic;

    return Movie.fromJson(data);
  }
}
