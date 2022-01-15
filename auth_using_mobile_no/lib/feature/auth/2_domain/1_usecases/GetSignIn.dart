

import 'package:auth_using_mobile_no/core/error/falilure.dart';
import 'package:auth_using_mobile_no/core/usecase/usecase.dart';
import 'package:auth_using_mobile_no/feature/auth/2_domain/1_usecases/register.dart';
import 'package:auth_using_mobile_no/feature/auth/2_domain/2_entities/user.dart';
import 'package:auth_using_mobile_no/feature/auth/2_domain/3_repositories/user_repository.dart';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetSignIn implements UseCase<AuthStatus,Params>{
  UserRepository repository;
  GetSignIn( this.repository);
  @override
  Future<Either<Failure, AuthStatus>> call(Params params) async{
    return await repository.SignIn(params.parameter);
  }


}

class NoParams extends Equatable{

  @override
  // TODO: implement props
  List<Object?> get props => [];
}