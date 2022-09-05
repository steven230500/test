part of 'bloc.dart';

@immutable
abstract class Test3State extends Equatable {
  final Model model;
  const Test3State(this.model);

  @override
  List<Object> get props => [model];
}

class InitialState extends Test3State {
  const InitialState(Model model) : super(model);
}

class LoadingState extends Test3State {
  const LoadingState(Model model) : super(model);
}

class LoadedState extends Test3State {
  const LoadedState(Model model) : super(model);
}

class LoadingBannersState extends Test3State {
  const LoadingBannersState(Model model) : super(model);
}

class LoadedBannersState extends Test3State {
  const LoadedBannersState(Model model) : super(model);
}

class ErrorState extends Test3State {
  const ErrorState(Model model) : super(model);
}

class Model extends Equatable {
  final Movie? movie;

  const Model({
    this.movie,
  });

  Model copyWith({
    Movie? movie,
  }) {
    return Model(
      movie: movie ?? this.movie,
    );
  }

  @override
  List<Object?> get props => [movie];
}
