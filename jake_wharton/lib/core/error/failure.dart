import 'package:equatable/equatable.dart';
//Class for failure or error
abstract class Failure extends Equatable{

  const Failure();

}

//general failure

class ServerFailure extends Failure{
  bool finish_fetching_remote;
  ServerFailure({required this.finish_fetching_remote});
  @override

  List<Object?> get props => [finish_fetching_remote];

}

class CacheFailure extends Failure{
  bool finish_fetching_local;
  CacheFailure({required this.finish_fetching_local});
  @override


  List<Object?> get props => [finish_fetching_local];

}