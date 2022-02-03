import 'package:flutter/material.dart';
import 'package:pay_razorpay/pages/paymentResultPage.dart';

import 'homepage.dart';

class RouteGenerator {
  static const String homePage = '/';
  static const String payment_processing = '/payment_processing';
  static final key=GlobalKey<NavigatorState>();
  RouteGenerator._() {}

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(
          builder: (_) => HomePage(),
        );

      case payment_processing:
        return MaterialPageRoute(
          builder: (_) => Payment_Processing(
            amount: int.parse(settings.arguments.toString()),
          ),
        );

      default:
        throw FormatException("Route not found");
    }
  }
}

class RouteException implements Exception {
  final String message;

  const RouteException(this.message);
}
