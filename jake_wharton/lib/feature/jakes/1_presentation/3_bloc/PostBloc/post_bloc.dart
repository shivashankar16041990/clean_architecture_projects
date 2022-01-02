import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:jake_wharton/core/NetworkInfo/NetworkInfo.dart';
import 'package:jake_wharton/core/error/failure.dart';
import 'package:jake_wharton/feature/jakes/2_domain/1_usecases/GetData.dart';
import 'package:jake_wharton/feature/jakes/2_domain/2_entities/Post%20Entity.dart';
import 'package:stream_transform/stream_transform.dart';


part 'post_event.dart';
part 'post_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class PostBloc extends Bloc<PostEvent, PostState> {

  late GetData getData;
  late NetworkInfo networkInfo;


  PostBloc({required GetData getDatap,required this.networkInfo }) : super(const PostState()) {
    // assert(getData != null);
    getData = getDatap;
    on<PostFetched>(
      _onPostFetched,
      transformer: throttleDroppable(throttleDuration),
    );
  }


  get empty => null;

  Future<void> _onPostFetched(PostFetched event,
      Emitter<PostState> emit,) async {

    if (state.hasReachedMax && !networkInfo.isInternetConnectionChage  )

     {
       networkInfo.setisInternetConnectionChagetofalse();

      return;
    }
    try {
      final failureorlist = await getData(NoParams());

      final result = failureorlist.fold((failure) {

        if (failure is ServerFailure) {
          if (failure.finish_fetching_remote) {

            emit(state.copyWith(hasReachedMax: true));
            return;
          }
          else
            emit(
                state.copyWith(hasReachedMax: false, status: PostStatus.ideal));
          return;
        }
        if (failure is CacheFailure) {
          if (failure.finish_fetching_local) {

            emit(
                state.copyWith(hasReachedMax: true, status: PostStatus.ideal));
            return;
          }
          else {
            emit(
                state.copyWith(hasReachedMax: false, status: PostStatus.ideal));
            return;
          }
        }
      },


              (success) {


            if (state.status == PostStatus.initial) {


              return emit(state.copyWith(
                status: PostStatus.success,
                posts: success,
                hasReachedMax: false,
              ));
              return;
            }


            if (success.isEmpty) {

              emit(state.copyWith(
                  hasReachedMax: false, status: PostStatus.ideal));
              return;
            }
            else {


              emit(
                state.copyWith(
                  status: PostStatus.success,
                  posts: List.of(state.posts)
                    ..addAll(success),
                  hasReachedMax: false,
                ),);
              return;
            }
          });
    }


    catch (_) {

      emit(state.copyWith(status: PostStatus.failure));
    }
  }
}
