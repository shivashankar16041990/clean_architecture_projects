import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/feature/api/1_presentation/1_widgets/buttom%20navigation.dart';

import 'feature/api/1_presentation/3_bloc/data_bloc.dart';

void main() {
  runApp(BlocProvider(
      create: (_) => DataBloc()..add(GetDataEvent()),
      child:MaterialApp(theme:ThemeData(scaffoldBackgroundColor:Colors.yellow,primarySwatch: Colors.red),home: HomePage())));
}
/*

class MyApp extends StatefulWidget
{
  const MyApp();
  @override
  State<StatefulWidget> createState() {
 return MyAppState();

  }


}
class MyAppState extends State<MyApp>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: ,),)



  }

}*/
