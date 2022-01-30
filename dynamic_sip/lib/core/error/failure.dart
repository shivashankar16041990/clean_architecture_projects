import 'package:equatable/equatable.dart';
//Class for failure or error
abstract class Failure extends Equatable{

   Failure();

}

//general failure

class ServerFailure extends Failure{
 String msg;
  ServerFailure({required this.msg});
  @override

  List<Object?> get props => [msg];

}

