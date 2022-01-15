import 'package:get_it/get_it.dart';

import 'core/usecase/usecase.dart';
import 'core/util/Stringtointeger.dart';
import 'feature/auth/1_presentation/3_bloc/LogicHandlingBloc/signin_bloc.dart';
import 'feature/auth/2_domain/1_usecases/GetSignIn.dart';
import 'feature/auth/2_domain/1_usecases/GetSignOut.dart';
import 'feature/auth/2_domain/1_usecases/register.dart';
import 'feature/auth/2_domain/2_entities/user.dart';
import 'feature/auth/2_domain/3_repositories/user_repository.dart';
import 'feature/auth/3_data/1_repositories_implementation/phone_number.dart';

final sl = GetIt.instance;
late SigninBloc blocvariable;

Future<void> init() async {
  print("inside init");



  sl.registerLazySingleton<UseCase<AuthStatus,Params>>(() => GetSignIn(sl()));
print("after first");

  sl.registerLazySingleton<UseCase<AuthStatus,Paramss>>(() => GetRegisterwithPhone(sl()));
  sl.registerLazySingleton<UseCase<AuthStatus,NoParams>>(() => GetSignOut(sl()));
sl.registerLazySingleton<UserRepository>(() => VerifyUsingPhone());
  sl.registerLazySingleton(() => InputConverter());



}