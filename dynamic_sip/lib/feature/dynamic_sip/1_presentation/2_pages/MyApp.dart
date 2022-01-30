

import 'package:dynamic_sip/feature/dynamic_sip/1_presentation/1_widgets/BlocCreate.dart';
import 'package:dynamic_sip/feature/dynamic_sip/1_presentation/3_bloc/GetData%20Bloc/get_data_bloc.dart';
import 'package:dynamic_sip/feature/dynamic_sip/1_presentation/Provider/Value%20Provider/LeftRightValue.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/src/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
 WidgetsBinding.instance!
        .addPostFrameCallback((con){ BlocProvider.of<GetDataBloc>(context).add(GetDataFromApi());
        print("callback is executed");

        } );
    return Scaffold(backgroundColor: Colors.green,floatingActionButton:FloatingActionButton(child: Icon(Icons.refresh),onPressed: () { BlocProvider.of<GetDataBloc>(context).add(GetDataFromApi()); },) ,
      body: Center(
        child:            BlocCreate()

        ),
    );

  }
}
