import 'package:auth_using_mobile_no/core/error/falilure.dart';
import 'package:auth_using_mobile_no/feature/auth/2_domain/2_entities/user.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository<T>{
  Future<Either<Failure, AuthStatus>> Register(T);
  Future<Either<Failure, AuthStatus>> SignIn(T);
  Future<Either<Failure, AuthStatus>> SignOut();

}
