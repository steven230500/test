part of 'bloc.dart';

abstract class Test3Event extends Equatable {
  const Test3Event();

  @override
  List<Object> get props => [];
}

class LoadEventHome extends Test3Event {
  const LoadEventHome();
}
