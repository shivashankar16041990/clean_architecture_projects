
import 'package:dynamic_sip/feature/dynamic_sip/2_domain/1_usecases/GetData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'core/UseCase/usecase.dart';
import 'feature/dynamic_sip/1_presentation/2_pages/MyApp.dart';
import 'feature/dynamic_sip/1_presentation/3_bloc/GetData Bloc/get_data_bloc.dart';
import 'feature/dynamic_sip/1_presentation/Provider/Value Provider/LeftRightValue.dart';
import 'feature/dynamic_sip/2_domain/2_entities/Entity.dart';
import 'injection_controller.dart';



void main() async {
  await init();
  var getDatap=sl<UseCase<List<Dsip>,NoParams>>() as GetData;
  runApp(ChangeNotifierProvider<LeftRightValue>(
    create: (_) => sl<LeftRightValue>(),child:
    BlocProvider<GetDataBloc>(
      create: (_) => GetDataBloc(getData: getDatap),
      child: MaterialApp(themeMode: ThemeMode.dark,

        home: MyApp(),
      ),
    ),
  ));
}
