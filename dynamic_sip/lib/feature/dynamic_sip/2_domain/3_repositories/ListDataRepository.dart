import 'package:dartz/dartz.dart';
import 'package:dynamic_sip/core/error/failure.dart';
import 'package:dynamic_sip/feature/dynamic_sip/2_domain/2_entities/Entity.dart';

abstract class ListDataRepository{
  Future<Either<Failure,List<Dsip>>> getData();

}