
import 'package:dartz/dartz.dart';
import 'package:dynamic_sip/core/NetworkInfo/NetworkInfo.dart';
import 'package:dynamic_sip/core/error/exception.dart';
import 'package:dynamic_sip/core/error/failure.dart';
import 'package:dynamic_sip/feature/dynamic_sip/2_domain/2_entities/Entity.dart';
import 'package:dynamic_sip/feature/dynamic_sip/2_domain/3_repositories/ListDataRepository.dart';
import 'package:dynamic_sip/feature/dynamic_sip/3_data/3_datasources/remote_data_store.dart';


class ListDataRepositoryImpl implements ListDataRepository{


  late RemoteDataSource remoteDataSource;
  late NetworkInfo networkInfo;


  ListDataRepositoryImpl({required this.remoteDataSource,

    required this.networkInfo});




  @override
  Future<Either<Failure,List<Dsip>>> getData() async{

        try{
    if(await networkInfo.isConnected) {

    print("internet is available");
        final newList = await remoteDataSource.getDataFromApi(
            );
        if (newList.isEmpty) {


          return Left(ServerFailure(msg: "No data"));
        }
        else {

          return Right(newList as List<Dsip>);
        }
      }
        else return Left(ServerFailure(msg :"No internet Connection"));






        }



        on ServerException{
      return Left(ServerFailure(msg:"Error Occured While Fetching Data"));
        }


    }
}







