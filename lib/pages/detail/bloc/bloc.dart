import 'dart:developer';

import 'package:bloc/bloc.dart' as bloc;
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:mobile_test/models/movie.dart';
import 'package:mobile_test/repository.dart';

part 'state.dart';

class Test3Bloc extends bloc.Cubit<Test3State> {
  final Repository repository;
  Test3Bloc(this.repository) : super(const InitialState(Model()));

  void getMovie({required int movieId}) async {
    emit(LoadingState(state.model));

    try {
      final movie = await repository.getMovie(movieId: movieId);

      emit(
        LoadedState(
          state.model.copyWith(
            movie: movie,
          ),
        ),
      );
    } catch (_) {
      emit(ErrorState(state.model));
    }
  }
}
