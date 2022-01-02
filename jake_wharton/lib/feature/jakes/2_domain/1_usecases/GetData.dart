import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:jake_wharton/core/UseCase/usecase.dart';
import 'package:jake_wharton/core/error/failure.dart';
import 'package:jake_wharton/feature/jakes/2_domain/2_entities/Post%20Entity.dart';
import 'package:jake_wharton/feature/jakes/2_domain/3_repositories/ListDataRepository.dart';

class GetData extends UseCase<List<Post>,NoParams>{
  final ListDataRepository repository;
  GetData(this.repository);




  Future<Either<Failure,List<Post>>> call (NoParams params)async{
    return await repository.getData();

  }
}
class NoParams extends Equatable{
  @override

  List<Object?> get props => [];

}