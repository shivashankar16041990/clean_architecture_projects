import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_trivia_clean_archit/core/util/input_convertor.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'core/platform/network_info.dart';
import 'core/usecase/usecase.dart';
import 'feature/number_trivia/1_presentation/2_pages/number_trivia_page.dart';
import 'feature/number_trivia/1_presentation/3_bloc/number_trivia_bloc.dart';
import 'feature/number_trivia/2_domain/1_usecases/get_concrete_number_trivia.dart';
import 'feature/number_trivia/2_domain/1_usecases/get_random_number_trivia.dart';
import 'feature/number_trivia/2_domain/2_entities/number_trivia.dart';
import 'feature/number_trivia/2_domain/3_repositories_abstract/number_trivia_repositories.dart';
import 'feature/number_trivia/3_data/3_datasources/number_trivia_local_data_sources.dart';
import 'feature/number_trivia/3_data/3_datasources/number_trivia_remote_data_source.dart';
import 'injection_controller.dart';
import 'package:http/http.dart' as http;

void main()async{
  print("inside main");
  WidgetsFlutterBinding.ensureInitialized();
  print("calling init()");


  await init();
  print("finishing init");
  //print(blocvariable.runtimeType);
var my=sl<InputConverter>();
print(my.runtimeType);
var concrete= sl<UseCase<NumberTrivia,Params>>() as GetConcreteNumberTrivia;
 var random= sl<UseCase<NumberTrivia,NoParams >>() as GetRandomNumberTrivia;
//var my=sl<NumberTriviaBloc>(param1:sl<GetConcreteNumberTrivia>(),param2:sl<GetRandomNumberTrivia>());
  //print( sl.isRegistered<NumberTriviaBloc>(instanceName:"numbertriviabloc"));
 //  print(sl.get<NumberTriviaBloc>(instanceName: "numbertriviabloc").runtimeType);
  runApp(BlocProvider<NumberTriviaBloc>(
      create:(_)=>//sl.get(instanceName:"numbertriviabloc"),//.get<NumberTriviaBloc>(),
      NumberTriviaBloc(inputConverter:sl<InputConverter>(), random:random ,concrete: concrete),
      //sl.<NumberTriviaBloc>(),
      child:MyApp()));

}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Number Trivia",home: NumberTriviaPage(),);
  }

}

