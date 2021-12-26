import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:number_trivia_clean_archit/core/error/failure.dart';
import 'package:number_trivia_clean_archit/core/usecase/usecase.dart';
import 'package:number_trivia_clean_archit/feature/number_trivia/2_domain/2_entities/number_trivia.dart';
import 'package:number_trivia_clean_archit/feature/number_trivia/2_domain/3_repositories_abstract/number_trivia_repositories.dart';
//class for getting random trivia
class GetRandomNumberTrivia extends UseCase<NumberTrivia,NoParams>{
  final NumberTriviaRepository repository;
  GetRandomNumberTrivia(this.repository);




  Future<Either<Failure,NumberTrivia>> call (NoParams params)async{
    return await repository.getRandomNumberTrivia();

  }
}
class NoParams extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}