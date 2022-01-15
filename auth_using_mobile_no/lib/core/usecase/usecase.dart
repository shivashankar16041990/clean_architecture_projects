import 'package:auth_using_mobile_no/core/error/falilure.dart';
import 'package:auth_using_mobile_no/feature/auth/2_domain/1_usecases/register.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type,Params>{
  Future<Either<Failure,Type>> call(Params params);
}
