import 'package:dartz/dartz.dart';
import 'package:dynamic_sip/core/UseCase/usecase.dart';
import 'package:dynamic_sip/core/error/failure.dart';
import 'package:dynamic_sip/feature/dynamic_sip/2_domain/2_entities/Entity.dart';
import 'package:dynamic_sip/feature/dynamic_sip/2_domain/3_repositories/ListDataRepository.dart';

import 'package:equatable/equatable.dart';


class GetData extends UseCase<List<Dsip>,NoParams>{
  final ListDataRepository repository;
  GetData(this.repository);




  Future<Either<Failure,List<Dsip>>> call (NoParams params)async{
    return await repository.getData();

  }
}
class NoParams extends Equatable{
  @override

  List<Object?> get props => [];

}