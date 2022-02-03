import 'dart:convert';


import 'package:http/http.dart' as http;

void main() async{


  Codec<String, String> stringToBase64 = utf8.fuse(base64);


  var response=await http.post(Uri.parse("https://api.razorpay.com/v1/orders"),body:jsonEncode( {
    "amount": "555000",
    "currency": "INR",
    "receipt": "rcptid_11"
  }),headers: {'Content-Type':'application/json',


  'Authorization': 'Basic ${
          stringToBase64.encode('key_id:key_secret') //key_id:secret key both are downloaded from razorpay dashboard
        }'



  });
  print(response.statusCode);
  print(response.body);
  print(response.toString());
}

