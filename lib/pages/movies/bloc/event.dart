part of 'bloc.dart';

abstract class Test2Event extends Equatable {
  const Test2Event();

  @override
  List<Object> get props => [];
}

class LoadEvent extends Test2Event {
  const LoadEvent();
}
