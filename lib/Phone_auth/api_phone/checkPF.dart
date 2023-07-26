import 'dart:convert';

import 'package:http/http.dart' as http;

Future<dynamic> loginPF(String pf) async {
  // const String baseUrl = '';
  String url = 'http://192.168.43.145:3000/users/auth/login';
  Map<dynamic, dynamic> data = {
    "PF": pf,
  };

  String jsonData = jsonEncode(data);
  print(jsonData);

  final response = await http.post(
    Uri.parse(url),
    body: jsonData,
    headers: {
      'Content-Type': 'application/json', // strictly Add the Content-Type header
    },
  );
  if (response.statusCode == 200) {
    response.body;
    print(response.body);
    return response.body;
  } else {
    return false;
  }
}
