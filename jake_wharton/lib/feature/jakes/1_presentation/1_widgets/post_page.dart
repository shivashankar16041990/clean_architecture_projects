import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:jake_wharton/core/UseCase/usecase.dart';
import 'package:jake_wharton/feature/jakes/1_presentation/3_bloc/PostBloc/post_bloc.dart';
import 'package:jake_wharton/feature/jakes/2_domain/1_usecases/GetData.dart';
import 'package:jake_wharton/feature/jakes/2_domain/2_entities/Post%20Entity.dart';
import '../../../../injection_controller.dart';
import 'Post_list.dart';


class PostsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  var getDatap=sl<UseCase<List<Post>,NoParams>>() as GetData;

    return Scaffold(
      appBar: AppBar(title: const Text('Jakes Git')),
      body:BlocProvider(
    create: (_) => PostBloc( getDatap:getDatap, networkInfo: sl() )..add(PostFetched()),
    child:


      PostsList(),



      )


    );
  }
}