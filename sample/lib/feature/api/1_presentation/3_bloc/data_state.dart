part of 'data_bloc.dart';

abstract class DataState extends Equatable {
  const DataState();
}

class DataInitial extends DataState {
  @override
  List<Object> get props => [];
}
class FailureinFetching extends DataState {
  String message;
  FailureinFetching({required this.message});
  @override
  List<Object> get props => [message];
}

class Success extends DataState {
  List<Data> personlist;
  Success ({required this.personlist});

  @override
  List<Object> get props => [personlist];
}

class Loading extends DataState {
  @override
  List<Object> get props => [];
}

