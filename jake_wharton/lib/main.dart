import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/UseCase/usecase.dart';
import 'feature/jakes/1_presentation/1_widgets/app.dart';
import 'feature/jakes/1_presentation/3_bloc/BlocObserver/simple_bloc_observer.dart';
import 'feature/jakes/2_domain/1_usecases/GetData.dart';
import 'feature/jakes/2_domain/2_entities/Post Entity.dart';
import 'injection_controller.dart';


void main() async{
  await init();
  var getDatap=sl<UseCase<List<Post>,NoParams>>() as GetData;
  BlocOverrides.runZoned(
        () => runApp(App()),
    blocObserver: SimpleBlocObserver(),
  );
}
