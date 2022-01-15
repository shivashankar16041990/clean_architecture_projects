
import 'package:dartz/dartz.dart';

import '../error/falilure.dart';

class InputConverter{
  Either<Failure,String> stringtoUnsignedIntegerand10digits(String numberString){
    /*try{
      if(numberString.length!=10) throw FormatException();
      final integer=int.parse(numberString);
      if(integer<0) throw FormatException();
      return Right(integer);
    }on FormatException
    {
     // return Left(InvalidInputFailure());
    }
  }*/
    return Right(numberString);
}}
class InvalidInputFailure extends Failure{
  @override
  // TODO: implement props
  List<Object?> get props => [];}