
import 'package:dartz/dartz.dart';
import 'package:jake_wharton/core/NetworkInfo/NetworkInfo.dart';
import 'package:jake_wharton/core/error/exception.dart';
import 'package:jake_wharton/core/error/failure.dart';
import 'package:jake_wharton/feature/jakes/2_domain/2_entities/Post%20Entity.dart';
import 'package:jake_wharton/feature/jakes/2_domain/3_repositories/ListDataRepository.dart';
import 'package:jake_wharton/feature/jakes/3_data/3_datasources/local_data_store.dart';
import 'package:jake_wharton/feature/jakes/3_data/3_datasources/remote_data_store.dart';

class ListDataRepositoryImpl implements ListDataRepository{

  late LocalDataSource localDataSource;
  late RemoteDataSource remoteDataSource;
  late NetworkInfo networkInfo;
   int page_index=1;
    int per_page=15;

  ListDataRepositoryImpl({required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo});




  @override
  Future<Either<Failure,List<Post>>> getData() async{

        try{
    if(await networkInfo.isConnected) {


        final newList = await remoteDataSource.getDataFromApi(
            page_index, per_page);
        if (newList.isEmpty) {


          return Left(ServerFailure(finish_fetching_remote: true));
        }
        else {
          await localDataSource.cacheData(newList, page_index);
          page_index++;
          return Right(newList as List<Post>);
        }
      }


    else
      {
        final storedlist= await localDataSource.getDataFromLocal(page_index);
        if(storedlist.isEmpty)
          {



            return Left(CacheFailure(finish_fetching_local: true));
          }
        else {
          page_index++;

          return Right(storedlist as List<Post>);
        }
      }}
        on ServerException{
      return Left(ServerFailure(finish_fetching_remote: false));
        }
        on CacheException{
          return Left(CacheFailure(finish_fetching_local: true));
        }

    }
}







