import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pay_razorpay/pages/route.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const platform = const MethodChannel("razorpay_flutter");
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var _razorpay = Razorpay();
  TextEditingController controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Razorback Payments"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
        padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: TextField(controller: controller,
                decoration:  InputDecoration(border:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                    hintText: "Enter the amount to be pay in rupees"),

              ),
            ),
            ElevatedButton(
              child: Text("Pay"),
              onPressed: () { Navigator.of(context).pushNamed(RouteGenerator.payment_processing,arguments:controller.text );},






            ),
          ],
        ),
      ),
    );
  }
}
