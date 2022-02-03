import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:razorpay_flutter/razorpay_flutter.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

part 'razor_event.dart';

part 'razor_state.dart';

class RazorBloc extends Bloc<RazorEvent, RazorState> {
  static const platform = const MethodChannel("razorpay_flutter");
  RazorBloc() : super(Loading()) {
    on<RazorEvent>((event, emit) async{
      if (event is Pay) {

        final completer = Completer<String>();

        emit(Loading());
        var _razorpay = Razorpay();

        _razorpay.on(
          Razorpay.EVENT_PAYMENT_SUCCESS,
          (PaymentSuccessResponse response) {
            print("Success order_Id:  ${response.orderId }, "
                " Payment_id:  ${response.paymentId },  Signature: ${response.signature }, ");
            emit(Success());
            _razorpay.clear();
            completer.complete("completed");
          },
        );
        _razorpay.on(
          Razorpay.EVENT_PAYMENT_ERROR,
          (PaymentFailureResponse response) {
            print("Failure ${response.code },   ${response.message } ");
            emit(Failure());

            _razorpay.clear();
            completer.complete("completed");
          },
        );
        _razorpay.on(
          Razorpay.EVENT_EXTERNAL_WALLET,
          (ExternalWalletResponse response) {
            print("External wallete ${response.walletName },   ");
            emit(ExtenalWallet());
            _razorpay.clear();
            completer.complete("completed");
          },
        );
        var option={
          "key":"rzp_test_XmU4SDn6evxRGM",
          "amount":event.amount,
          "name":"test",

          'send_sms_hash': true,
          'retry': {'enabled': true, 'max_count': 1},

          'description': ' ',
          'order_id':"order_Ird89mCmSmMbhE",
          'prefill': {
            'contact': '9123456789',
            'email': 'gaurav.kumar@example.com'
          },
          /*'external': {
            'wallets': ['paytm']
          }*/



      };


        _razorpay.open(option);


        await Future.wait<dynamic>([completer.future]);

        print("finished the bloc");
    }});
  }
}
