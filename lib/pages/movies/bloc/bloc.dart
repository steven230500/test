import 'package:bloc/bloc.dart' as bloc;
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_test/models/movie.dart';
import 'package:mobile_test/repository.dart';

part 'event.dart';
part 'state.dart';

class Test2Bloc extends bloc.Bloc<Test2Event, Test2State> {
  final Repository repository;
  Test2Bloc(this.repository) : super(const InitialState(Model())) {
    on<LoadEvent>(_onLoadEvent);
  }

  void _onLoadEvent(LoadEvent event, Emitter<Test2State> emit) async {
    emit(LoadingState(state.model));

    try {
      final movies = await repository.getMovies(filter: 'popular');
      emit(
        LoadedState(state.model.copyWith(movies: movies)),
      );
    } catch (_) {
      emit(ErrorState(state.model));
    }
  }
}
