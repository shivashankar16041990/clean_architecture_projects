import 'package:dartz/dartz.dart';
import 'package:jake_wharton/core/error/failure.dart';
import 'package:jake_wharton/feature/jakes/2_domain/2_entities/Post%20Entity.dart';

abstract class ListDataRepository{
  Future<Either<Failure,List<Post>>> getData();

}