

import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo{
  Future<bool> get isConnected;
  bool get isInternetConnectionChage;
  void setisInternetConnectionChagetofalse();
}

class NetworkInfoImpl implements NetworkInfo {

  final InternetConnectionChecker dataConnectionChecker;
  bool isInternetConnectionChage=true;
  NetworkInfoImpl({required this.dataConnectionChecker})

  {
    {
      dataConnectionChecker.onStatusChange.listen((status) {


        isInternetConnectionChage=true;});
    }
  }

  static bool _firsttimecheck = false;
  static Future<bool> _isConnected = Future.value(false);

  @override

  Future<bool> get isConnected {
    if (_firsttimecheck == false) {
      dataConnectionChecker.onStatusChange.listen((status) {
        switch (status) {
          case InternetConnectionStatus.connected:
            _isConnected = Future.value(true);
            break;
          case InternetConnectionStatus.disconnected:
            _isConnected = Future.value(false);
            break;
        }
      });
      _isConnected = dataConnectionChecker.hasConnection;
      _firsttimecheck = true;
      return _isConnected;
    }
    else {
      return _isConnected;
    }
  }
  void setisInternetConnectionChagetofalse(){
    isInternetConnectionChage=false;
  }



}