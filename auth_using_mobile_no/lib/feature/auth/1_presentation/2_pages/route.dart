import 'package:auth_using_mobile_no/feature/auth/1_presentation/2_pages/takemobileno.dart';
import 'package:flutter/material.dart';

import 'homepage.dart';
import 'inputcode.dart';

class RouteGenerator {

  static const String homePage = '/';
  static const String takemobileno  = '/takemobileno';
  static const String capturecode  = '/capturecode';
  static const String welcome  = '/welcome';

  static final key=GlobalKey<NavigatorState>();
  RouteGenerator._() {}

  static Route<dynamic> generateRoute(RouteSettings settings) {

    switch (settings.name) {
      case homePage:

        return MaterialPageRoute(
          builder: (_) =>  HomePage(),
        );
      case takemobileno:{

        return MaterialPageRoute(
          builder: (_) =>   TakeMobileNo(),
        );
      }

      case capturecode:{

        return MaterialPageRoute(
          builder: (_) =>  CaptureCode(),
        );
      }

      /*case welcome:{

        return MaterialPageRoute(
          builder: (_) => const Welcome(),
        );
      }*/


      default:
        throw FormatException("Route not found");
    }
  }
}

class RouteException implements Exception {
  final String message;
  const RouteException( this.message);
}