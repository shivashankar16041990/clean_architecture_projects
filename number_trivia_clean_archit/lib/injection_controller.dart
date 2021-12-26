
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:number_trivia_clean_archit/feature/number_trivia/1_presentation/3_bloc/number_trivia_bloc.dart';
import 'package:number_trivia_clean_archit/feature/number_trivia/2_domain/1_usecases/get_random_number_trivia.dart';
import 'package:number_trivia_clean_archit/feature/number_trivia/3_data/3_datasources/number_trivia_remote_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'core/platform/network_info.dart';
import 'core/usecase/usecase.dart';
import 'package:number_trivia_clean_archit/feature/number_trivia/2_domain/1_usecases/get_concrete_number_trivia.dart';
import 'package:number_trivia_clean_archit/feature/number_trivia/2_domain/1_usecases/get_random_number_trivia.dart';
import 'core/util/input_convertor.dart';
import 'feature/number_trivia/2_domain/1_usecases/get_concrete_number_trivia.dart';
import 'feature/number_trivia/2_domain/2_entities/number_trivia.dart';
import 'feature/number_trivia/2_domain/3_repositories_abstract/number_trivia_repositories.dart';
import 'feature/number_trivia/3_data/1_repositories_implementation/number_trivia_repository_impl.dart';
import 'feature/number_trivia/3_data/3_datasources/number_trivia_local_data_sources.dart';

final sl = GetIt.instance;
late NumberTriviaBloc blocvariable;

Future<void> init() async {
print("inside init");



  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => http.Client());
final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  sl.registerLazySingleton(() => InputConverter());

  sl.registerLazySingleton<NetworkInfo>(
          () => NetworkInfoImpl(dataConnectionChecker: sl()));
  sl.registerLazySingleton<NumberTriviaRemoteDataSource>(
          () => NumberTriviaRemoteDataSourceImpl(client: sl()));

  sl.registerLazySingleton<NumberTriviaLocalDataSource>(
          () => NumberTriviaLocalDataSourceImpl(sharedPreferences: sl()));


  sl.registerLazySingleton<NumberTriviaRepository>(() =>
      NumberTriviaRepositoryImpl(
          remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));

  sl.registerLazySingleton<UseCase<NumberTrivia,NoParams>>(()=> GetRandomNumberTrivia(sl()));
  sl.registerLazySingleton<UseCase<NumberTrivia,Params>>(()=>GetConcreteNumberTrivia(sl()));
   print("finishing init");
}
