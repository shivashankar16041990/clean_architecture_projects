import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dynamic_sip/core/error/failure.dart';
import 'package:dynamic_sip/feature/dynamic_sip/2_domain/1_usecases/GetData.dart';
import 'package:dynamic_sip/feature/dynamic_sip/2_domain/2_entities/Entity.dart';
import 'package:equatable/equatable.dart';

part 'get_data_event.dart';

part 'get_data_state.dart';

class GetDataBloc extends Bloc<GetDataEvent, GetDataState> {
  late GetData getData;

  GetDataBloc({required this.getData}) : super(Loading()) {
    on<GetDataEvent>((event, emit) async {
      if (event is GetDataFromApi) {
        print("Emiting Loading");
        emit(Loading());
        try {
          print("calling getData");
          final failureorlist = await getData(NoParams());

          final result = failureorlist.fold(
            (failure) {
              if (failure is ServerFailure)
                {print("failure is ServerFailure");


                  emit(Fail(msg: failure.msg));}
              else {
                emit(Fail(msg: "Some thing Went Wrong"));
              }
            },
            (success) {
              emit(Success(datalist: success));
            },
          );
        } catch (_) {
          emit(Fail(msg: "Something Get Wrong"));
        }
      }
    });
  }
}
