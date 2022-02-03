import 'dart:convert';
import 'package:crypto/crypto.dart';

void main() {
  String key = "key_secret";   //key_secret is downloaded from razorpay dashboard
  String order_id = 'order_id';    //order_id order_id generated from order API see order.dart file
  String razorpay_payment_id = "razorpay_payment_id";  //razorpay_payment_id is a success response when you call _razorpay.open()
  String message=order_id+"|"+razorpay_payment_id; 
  
      Hmac hmac = new Hmac(sha256, utf8.encode(key));
  Digest digest = hmac.convert(utf8.encode(message));

  print(digest);

  print(digest);
}
