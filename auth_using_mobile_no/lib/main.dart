import 'dart:async';

import 'package:auth_using_mobile_no/core/util/Stringtointeger.dart';
import 'package:auth_using_mobile_no/feature/auth/1_presentation/2_pages/route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/usecase/usecase.dart';
import 'core/util/locale.dart';

import 'feature/auth/1_presentation/3_bloc/LanguageHandlingCubit/change_language_bloc.dart';
import 'feature/auth/1_presentation/3_bloc/LogicHandlingBloc/signin_bloc.dart';
import 'feature/auth/1_presentation/3_bloc/automatic_sms_bloc.dart';
import 'feature/auth/2_domain/1_usecases/GetSignIn.dart';
import 'feature/auth/2_domain/1_usecases/GetSignOut.dart';
import 'feature/auth/2_domain/1_usecases/register.dart';
import 'feature/auth/2_domain/2_entities/user.dart';
import 'injection.dart';

void main() async {
await init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiBlocProvider(providers: [
    BlocProvider<AutomaticSmsBloc>(create: (_) => AutomaticSmsBloc()),
    BlocProvider<ChangeLanguageBloc>(create: (_) => ChangeLanguageBloc()),


     BlocProvider<SigninBloc>(create: (_) => SigninBloc(
       inputConverter: sl<InputConverter>(),
       getSignOut: sl<UseCase<AuthStatus,NoParams>>() as GetSignOut,
       getSignIn: sl<UseCase<AuthStatus,Params>>() as GetSignIn ,
       getRegisterwithPhone: sl<UseCase<AuthStatus,Paramss>>() as GetRegisterwithPhone,)),
      //BlocProvider<SigninBloc>(create: (_) => SigninBloc()),

      ],

      child:
      MaterialApp(
      onGenerateRoute: RouteGenerator.generateRoute,
      navigatorKey: RouteGenerator.key,
      initialRoute: RouteGenerator.homePage,

      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
    //  supportedLocales:List.generate(LocaleList.code.length, (index) =>   Locale(LocaleList.code[index])),
      //locale:Locale.fromSubtags(
        //  languageCode: LocaleList.code[
          //context.watch<ChangeLanguageBloc>().state

         // ])
   )));
}

