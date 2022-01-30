part of 'get_data_bloc.dart';

abstract class GetDataState extends Equatable {
  const GetDataState();
}

class Loading extends GetDataState {
  @override
  List<Object> get props => [];
}
class Success extends GetDataState {
  List<Dsip> datalist;
  Success({required this.datalist});
  @override
  List<Object> get props => [datalist];
}

class Fail extends GetDataState {
  String msg;
  Fail({required this.msg});
  @override
  List<Object> get props => [msg];
}
