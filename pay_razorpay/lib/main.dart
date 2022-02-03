
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pay_razorpay/pages/RazorPayBloc/razor_bloc.dart';
import 'package:pay_razorpay/pages/homepage.dart';
import 'package:pay_razorpay/pages/route.dart';
import 'package:flutter/services.dart';

import 'package:razorpay_flutter/razorpay_flutter.dart';

import 'package:fluttertoast/fluttertoast.dart';
void main() {
  print("in main method");
  runApp(

    BlocProvider<RazorBloc>(
      create: (_) => RazorBloc(),
      child: MaterialApp(
        onGenerateRoute: RouteGenerator.generateRoute,
        navigatorKey: RouteGenerator.key,
        initialRoute: RouteGenerator.homePage,
      ),
    ),
  );
}


