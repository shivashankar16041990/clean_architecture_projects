import 'package:equatable/equatable.dart';

//Class for failure or error

abstract class Failure extends Equatable{

   Failure();

}

//general failure

class ServerFailure extends Failure{
  String message;

  ServerFailure({required this.message});
  @override
  // TODO: implement props
  List<Object?> get props => [message];

}

class CacheFailure extends Failure{
  String message;
  CacheFailure({required this.message});
  @override
  // TODO: implement props
  List<Object?> get props => [message];

}