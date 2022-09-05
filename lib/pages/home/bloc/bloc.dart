import 'package:bloc/bloc.dart' as bloc;
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_test/models/movie.dart';
import 'package:mobile_test/repository.dart';

part 'event.dart';
part 'state.dart';

class Test1Bloc extends bloc.Bloc<Test1Event, Test1State> {
  final Repository repository;
  Test1Bloc(this.repository) : super(const InitialState(Model())) {
    on<LoadEventHome>(_onLoadEvent);
  }

  void _onLoadEvent(LoadEventHome event, Emitter<Test1State> emit) async {
    emit(LoadingState(state.model));

    try {
      final moviesPopular = await repository.getMovies(filter: 'popular');
      final moviesTop = await repository.getMovies(filter: 'top_rated');
      emit(
        LoadedState(
          state.model.copyWith(
            popular: moviesPopular,
            tops: moviesTop,
          ),
        ),
      );
    } catch (_) {
      emit(ErrorState(state.model));
    }
  }
}
