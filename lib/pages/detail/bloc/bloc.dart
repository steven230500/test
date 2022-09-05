import 'package:bloc/bloc.dart' as bloc;
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:mobile_test/models/movie.dart';
part 'state.dart';

class Test3Bloc extends bloc.Cubit<Test3State> {
  Test3Bloc() : super(const InitialState(Model()));

  void getMovie({required Movie movie}) async {
    emit(LoadingState(state.model));

    try {
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
