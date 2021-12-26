import 'package:dartz/dartz.dart';
import 'package:number_trivia_clean_archit/core/error/failure.dart';

class InputConverter{
  Either<Failure,int> stringtoUnsignedInteger(String numberString){
try{
  final integer=int.parse(numberString);
  if(integer<0) throw FormatException();
  return Right(integer);
}on FormatException
  {
    return Left(InvalidInputFailure());
  }
  }
}
class InvalidInputFailure extends Failure{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}