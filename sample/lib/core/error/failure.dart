import 'package:equatable/equatable.dart';
//Class for failure or error
abstract class Failure extends Equatable{

  const Failure();

}

//general failure

class ServerFailure extends Failure{
  String message;
  ServerFailure({required this.message});
  @override

  List<Object?> get props => [message];

}
