

import 'package:auth_using_mobile_no/core/error/falilure.dart';
import 'package:auth_using_mobile_no/core/usecase/usecase.dart';
import 'package:auth_using_mobile_no/feature/auth/2_domain/2_entities/user.dart';
import 'package:auth_using_mobile_no/feature/auth/2_domain/3_repositories/user_repository.dart';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'GetSignIn.dart';

class GetSignOut implements UseCase<AuthStatus,NoParams>{
  UserRepository repository;
  GetSignOut( this.repository);
  @override
  Future<Either<Failure, AuthStatus>> call(NoParams params) async{
    return await repository.SignOut();
  }


}



