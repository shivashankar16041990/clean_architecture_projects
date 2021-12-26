import 'package:dartz/dartz.dart';
import 'package:number_trivia_clean_archit/core/error/failure.dart';
import 'package:number_trivia_clean_archit/feature/number_trivia/2_domain/2_entities/number_trivia.dart';
// abstract class implemeted by data layer
abstract class NumberTriviaRepository{
  Future<Either<Failure,NumberTrivia>> getRandomNumberTrivia();
  Future<Either<Failure,NumberTrivia>>getConcreteNumberTrivia(int number);
}