

import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:http/http.dart' as http;

import 'core/NetworkInfo/NetworkInfo.dart';
import 'core/UseCase/usecase.dart';
import 'feature/jakes/2_domain/1_usecases/GetData.dart';
import 'feature/jakes/2_domain/2_entities/Post Entity.dart';
import 'feature/jakes/2_domain/3_repositories/ListDataRepository.dart';
import 'feature/jakes/3_data/1_repositories_implementation/ListDataRepositoryImpl.dart';
import 'feature/jakes/3_data/2_models/list_to_store.dart';
import 'feature/jakes/3_data/3_datasources/local_data_store.dart';
import 'feature/jakes/3_data/3_datasources/remote_data_store.dart';
final sl = GetIt.instance;


Future<void> init() async {
  late Box<ListToStore>box;
await Hive.initFlutter();
Hive.registerAdapter(PostAdapter());
Hive.registerAdapter(ListToStoreAdapter());
if (!Hive.isBoxOpen("data")) {
  box= await Hive.openBox<ListToStore>("data");

}
else
{
  box=Hive.box<ListToStore>("data");

}





sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => http.Client());





  sl.registerLazySingleton<NetworkInfo>(
          () => NetworkInfoImpl(dataConnectionChecker: sl()));
  sl.registerLazySingleton<RemoteDataSource>(
          () => RemoteDataSourceImpl(client: sl()));

  sl.registerLazySingleton<LocalDataSource>(
          () =>LocalDataSourceImpl(box:box ));


  sl.registerLazySingleton<ListDataRepository>(() =>
      ListDataRepositoryImpl(
          remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));

  sl.registerLazySingleton<UseCase<List<Post>,NoParams>>(()=> GetData(sl()));


}
