import 'package:dartz/dartz.dart';
import 'package:number_trivia_clean_archit/core/error/exception.dart';
import 'package:number_trivia_clean_archit/core/error/failure.dart';
import 'package:number_trivia_clean_archit/core/platform/network_info.dart';
import 'package:number_trivia_clean_archit/feature/number_trivia/2_domain/2_entities/number_trivia.dart';
import 'package:number_trivia_clean_archit/feature/number_trivia/2_domain/3_repositories_abstract/number_trivia_repositories.dart';
import 'package:number_trivia_clean_archit/feature/number_trivia/3_data/2_models/number_trivia_model.dart';
import 'package:number_trivia_clean_archit/feature/number_trivia/3_data/3_datasources/number_trivia_local_data_sources.dart';
import 'package:number_trivia_clean_archit/feature/number_trivia/3_data/3_datasources/number_trivia_remote_data_source.dart';


typedef Future<NumberTriviaModel> _ChooseRemoteorLocal();

class NumberTriviaRepositoryImpl implements NumberTriviaRepository{

  late NumberTriviaLocalDataSource localDataSource;
  late NumberTriviaRemoteDataSource remoteDataSource;
  late NetworkInfo networkInfo;

  NumberTriviaRepositoryImpl({required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo});

  @override
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(int number)async {
return await _getTrivia(() async{return await remoteDataSource.getConcreteNumberTrivia(number);});


  }

  @override
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia() async{
return await _getTrivia(
        () async{return await remoteDataSource.getRandomNumberTrivia();}
);

  }

  Future<Either<Failure, NumberTrivia>> _getTrivia(_ChooseRemoteorLocal chooseRemoteorLocal )async {




    if(await networkInfo.isConnected)
    {
      try{
        final remoteTrivia=await chooseRemoteorLocal();
       localDataSource.cacheNumberTrivia(remoteTrivia);
      return Right(remoteTrivia);}
      on ServerException {
        return Left(ServerFailure());
      }
    }
    else
      try {
        final localTrivia=await localDataSource.getLastNumberTrivia();
        return Right(localTrivia);
      }
      on CacheException{
        return Left(CacheFailure());
      }
  }

  }

























/*

class NumberTriviaRepositoryImpl implements NumberTriviaRepository{

  late NumberTriviaLocalDataSource localDataSource;
  late NumberTriviaRemoteDataSource remoteDataSource;
  late NetworkInfo networkInfo;

  NumberTriviaRepositoryImpl({required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo});

    @override
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(int number)async {
   if(await networkInfo.isConnected){
  try{ final remoteTrivia=await remoteDataSource.getConcreteNumberTrivia(number);
   localDataSource.cacheNumberTrivia(remoteTrivia);
   return Right(remoteTrivia);}
      on ServerException {
    return Left(ServerFailure());
      }
  }
    else
     try {
        final localTrivia=await localDataSource.getLastNumberTrivia();
        return Right(localTrivia);
      }
    on CacheException{
      return Left(CacheFailure());
    }


    }

  @override
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia() async{

    if(await networkInfo.isConnected){
      try{ final remoteTrivia=await remoteDataSource.getRandomNumberTrivia();
      localDataSource.cacheNumberTrivia(remoteTrivia);
      return Right(remoteTrivia);}
      on ServerException {
        return Left(ServerFailure());
      }
    }
    else
      try {
        final localTrivia=await localDataSource.getLastNumberTrivia();
        return Right(localTrivia);
      }
      on CacheException{
        return Left(CacheFailure());
      }
  }

}*/
