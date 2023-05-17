import 'dart:convert';

import 'package:http/http.dart';

import 'package:http/http.dart' as http;

postCustomer(
    String refNumber,
    String firstname,
    String lastname,
    String phoneNumber,
    String gender,
    String birthDate,
    String email,
    String occupation,
    String residence,
    String nationality,
    String kinName,
    String kinNumber) async {
  String url = "https://api.grow.curacel.co/api/v1/customers";

  const String apikey = 'Bearer 667|RC6ubQEjOfd8AIze9JTBUeg2atJNdem5QKp9sR9W';

  Map<dynamic, dynamic> data = {
    "ref": refNumber,
    "first_name": firstname,
    "last_name": lastname,
    "middlename": '',
    "sex": gender,
    "birth_date": birthDate,
    "phone": phoneNumber,
    "email": email,
    "bvn": '',
    "occupation": occupation,
    "city": '',
    "residential_address": residence,
    "state": '',
    "nationality": nationality,
    "country": '',
    "next_of_kin_name": kinName,
    "next_of_kin_phone": kinNumber,
    "proof_of_address": {
      "type": 'pdf',
      "url": 'https://chiplc.com/wp-content/uploads/2019/09/New-CHI-logo.png'
    }
  };

  String jsonData = jsonEncode(data);

  final response = await http.post(
    Uri.parse(url),
    headers: {
      'accept': 'application/json',
      'content-type': 'application/json',
      'authorization': apikey,
    },
    body: jsonData,
  );

  if (response.statusCode == 201) {
    final responseBody = jsonDecode(response.body);

    // print(responseBody);
  } else {
    final error = jsonDecode(response.body);

    throw Exception('failed : $error');
  }
}


// import 'dart:convert';

// import 'package:http/http.dart';

// import 'package:http/http.dart' as http;

// postCustomer(
//     String refNumber,
//     String firstname,
//     String lastname,
//     String phoneNumber,
//     String gender,
//     String birthDate,
//     String email,
//     String occupation,
//     String residence,
//     String nationality,
//     String kinName,
//     String kinNumber) async {
//   String url = "https://api.grow.curacel.co/api/v1/customers";

//   const String apikey = 'Bearer 667|RC6ubQEjOfd8AIze9JTBUeg2atJNdem5QKp9sR9W';

//   Map<dynamic, dynamic> data = {
//     "ref":'43fsd45',
//     "first_name": 'victor' ,
//     "last_name": 'nsenji',
//     "middlename": 'partek',
//     "sex": "M",
//     "birth_date": '2003-07-28',
//     "email": 'test@gmail.com',
//     "bvn": '',
//     "occupation": 'carpenter',
//     "city": '',
//     "residential_address": 'kampala',
//     "state": '',
//     "nationality": 'Ugandan',
//     "country": '',
//     "next_of_kin_name": 'toretto',
//     "next_of_kin_phone": '3453454534',
//     "proof_of_address": {
//       "type": 'pdf',
//       "url": 'https://chiplc.com/wp-content/uploads/2019/09/New-CHI-logo.png'
//     }
//   };

//   String jsonData = jsonEncode(data);

//   final response = await http.post(
//     Uri.parse(url),
//     headers: {
//       'accept': 'application/json',
//       'content-type': 'application/json',
//       'authorization': apikey,
//     },
//     body: jsonData,
//   );

//   if (response.statusCode == 200) {
//     final responseBody = jsonDecode(response.body);
//     final data = responseBody['message'];
//     print(data);
//   } else {
//     final error = jsonDecode(response.body);
//     ;
//     throw Exception('failed : $error');
//   }
// }
