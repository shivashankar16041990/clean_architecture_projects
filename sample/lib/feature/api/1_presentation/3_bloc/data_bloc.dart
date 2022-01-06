import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sample/core/error/failure.dart';
import 'package:sample/feature/api/2_domain/1_usecases/GetData.dart';
import 'package:sample/feature/api/2_domain/2_entities/entity.dart';

part 'data_event.dart';
part 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  DataBloc() : super(DataInitial()) {
    on<DataEvent>((event, emit) async{
      if (event is GetDataEvent) {
        emit(Loading());
       var failureorsucces=await GetData().call();

       failureorsucces.fold((failure){
         if(failure is ServerFailure){
           emit(FailureinFetching(message: failure.message));
         }



       },(success){
         emit(Success(personlist: success));
       }




       );











      }

    });
  }
}
