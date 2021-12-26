import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:number_trivia_clean_archit/core/error/failure.dart';
import 'package:number_trivia_clean_archit/core/usecase/usecase.dart';
import 'package:number_trivia_clean_archit/feature/number_trivia/2_domain/2_entities/number_trivia.dart';
import 'package:number_trivia_clean_archit/feature/number_trivia/2_domain/3_repositories_abstract/number_trivia_repositories.dart';
//usecase when user enters the number
class GetConcreteNumberTrivia extends UseCase<NumberTrivia,Params>
{
  final NumberTriviaRepository repository;
  GetConcreteNumberTrivia(this.repository);

  Future<Either<Failure,NumberTrivia>> call (Params params)async{

    return await repository.getConcreteNumberTrivia(params.number);

  }
}

class Params extends Equatable{
  final int number;
  Params({required this.number});



  @override
  // TODO: implement props
  List<Object?> get props => [number];}
