

import 'package:auth_using_mobile_no/core/error/falilure.dart';
import 'package:auth_using_mobile_no/core/usecase/usecase.dart';
import 'package:auth_using_mobile_no/feature/auth/2_domain/2_entities/user.dart';
import 'package:auth_using_mobile_no/feature/auth/2_domain/3_repositories/user_repository.dart';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetRegisterwithPhone implements UseCase<AuthStatus,Paramss>{
  UserRepository repository;
  GetRegisterwithPhone( this.repository);
  @override
  Future<Either<Failure, AuthStatus>> call(Paramss params) async{
     return await repository.Register(params.parameter);
  }


}

class Params extends Equatable{
  final int parameter;

  Params(this.parameter);
  @override
  // TODO: implement props
  List<Object?> get props => [parameter];
}
class Paramss extends Equatable{
  final String parameter;

  Paramss(this.parameter);
  @override
  // TODO: implement props
  List<Object?> get props => [parameter];
}