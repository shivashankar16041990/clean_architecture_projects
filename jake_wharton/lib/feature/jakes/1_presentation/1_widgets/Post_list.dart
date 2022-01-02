import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:jake_wharton/feature/jakes/1_presentation/1_widgets/post_list_item.dart';
import 'package:jake_wharton/feature/jakes/1_presentation/3_bloc/PostBloc/post_bloc.dart';

import 'bottom_loader.dart';



class PostsList extends StatefulWidget {
  @override
  _PostsListState createState() => _PostsListState();
}

class _PostsListState extends State<PostsList> {
  final _scrollController = ScrollController();
  
  @override
  void initState() {
 //   BlocProvider.of<PostBloc>(context).add(PostFetched());
    super.initState();
    _scrollController.addListener(_onScroll);
    InternetConnectionChecker().onStatusChange.listen((event) {if(InternetConnectionStatus.connected==event)
    {
      context.read<PostBloc>().add(PostFetched());
    }
    });
  }

  @override
  Widget build(BuildContext context) {


    return BlocConsumer<PostBloc, PostState>(builder: (context,state){
      if(state.posts.length==0){
        return
            Center(child: Text("no internet Connection"),);
      }


      return ListView.builder(

        itemBuilder: (BuildContext context, int index) {


            return index >= state.posts.length
                ? BottomLoader()
                : PostListItem(post: state.posts[index]);

        },
        itemCount: state.hasReachedMax
            ? state.posts.length
            : state.posts.length + 1,
        controller: _scrollController,
      );
    }, listener: (_,__){});
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<PostBloc>().add(PostFetched());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.8);
  }
}