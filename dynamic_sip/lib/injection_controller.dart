
import 'package:dynamic_sip/feature/dynamic_sip/1_presentation/Provider/Value%20Provider/LeftRightValue.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';
import 'core/NetworkInfo/NetworkInfo.dart';
import 'core/UseCase/usecase.dart';
import 'feature/dynamic_sip/2_domain/1_usecases/GetData.dart';
import 'feature/dynamic_sip/2_domain/2_entities/Entity.dart';
import 'feature/dynamic_sip/2_domain/3_repositories/ListDataRepository.dart';
import 'feature/dynamic_sip/3_data/1_repositories_implementation/ListDataRepositoryImpl.dart';
import 'feature/dynamic_sip/3_data/3_datasources/remote_data_store.dart';
import 'package:flutter/material.dart';
final sl = GetIt.instance;


Future<void> init() async {






sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => http.Client());





  sl.registerLazySingleton<NetworkInfo>(
          () => NetworkInfoImpl(dataConnectionChecker: sl()));
  sl.registerLazySingleton<RemoteDataSource>(
          () => RemoteDataSourceImpl(client: sl()));


  sl.registerLazySingleton<ListDataRepository>(() =>
      ListDataRepositoryImpl(
          remoteDataSource: sl(), networkInfo: sl()));

  sl.registerLazySingleton<UseCase<List<Dsip>,NoParams>>(()=> GetData(sl()));
sl.registerLazySingleton<LeftRightValue>(
        () => LeftRightValue(leftValue: "50",rightValue: "50",backgroundColor: Colors.green,prevright: "50"));

}
