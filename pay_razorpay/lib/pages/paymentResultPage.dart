import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'RazorPayBloc/razor_bloc.dart';

class Payment_Processing extends StatelessWidget {
  Payment_Processing({Key? key, required this.amount}) : super(key: key);
  int amount;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<RazorBloc>(context).add(Pay(amount: amount));
    return Scaffold(
      appBar: AppBar(
        title: Text("Razorback Payments"),
      ),
      body: Center(
        child: BlocBuilder<RazorBloc, RazorState>(
          builder: (context, state) {
            if (state is Loading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is Failure) {
              return Center(child: Text("something went Wrong"));
            } else if (state is Success) {
              return Center(child: Text("Payment is Successful"));
            }
            else if (state is ExtenalWallet) {
              return Center(child: Text("External Wallet is selected"));
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
