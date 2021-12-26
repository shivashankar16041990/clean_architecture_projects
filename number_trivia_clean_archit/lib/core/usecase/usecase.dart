import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:number_trivia_clean_archit/core/error/failure.dart';
import 'package:number_trivia_clean_archit/feature/number_trivia/2_domain/2_entities/number_trivia.dart';
//abstract class with one one method call which can be called by object name
//abstract class implemented by domain layer
abstract class UseCase <Type,Params>{
  Future<Either<Failure,Type>> call (Params params);

}
//class for No Params
