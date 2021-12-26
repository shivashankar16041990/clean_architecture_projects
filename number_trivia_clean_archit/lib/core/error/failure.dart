import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

//Class for failure or error

abstract class Failure extends Equatable{

  const Failure();

}

//general failure

class ServerFailure extends Failure{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class CacheFailure extends Failure{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}