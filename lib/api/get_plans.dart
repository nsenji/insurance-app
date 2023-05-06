import 'dart:convert';
import 'dart:developer';
import 'dart:html';
import 'package:http/http.dart' as http;

import 'package:insurease/notifiers/allPlansNotifier.dart';

import '../models/productPlan_model.dart';

getPlans(AllPlansNotifier allPlansNotifier, String planName) async {
  const String baseUrl = 'api.grow.curacel.co';
  String path =
      '/api/v1/products?page=1&per_page=20&type=$planName&with=cover_benefits&calculate_premium=0&trip_frequency=recurring';
  const String apikey =
      'Bearer 903c2a641e5a3e51f38a0dbc8349cb811562375cdc276b16bed93b6cc7ad7e3d';

  final url = Uri.https(baseUrl, path);

  final response = await http.get(url, headers: {
    'accept': 'application/json',
    'authorization': apikey,
  });

  List<ProductPlanModel> productPlanList = [];

  if (response.statusCode == 200) {
    final responseBody = jsonDecode(response.body);
    final data = responseBody['data'];
    log(data);
    for (final item in data) {
      ProductPlanModel prod = ProductPlanModel.fromMap(item);
      productPlanList.add(prod);
    }
    allPlansNotifier.plansList = productPlanList;
  } else {
    throw Exception('failed to get products');
  }
}







// To access an API using the http package in Flutter, you can follow these steps:

// 1. Import the http package in your project file.
// 2. Make a network request using the http package.
// 3. Convert the response into a custom dart object.
// 4. Store the object into Model class.
// 5. Retrieve and show the data from the model.

// Here is an example of how to do a GET API request using the http package:

// ```dart
// import 'package:http/http.dart' as http;
// Future<List> fetchTodos() async {
//   final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
//   return json.decode(response.body);
// }
// ```

// Here is an example of how to do a POST API request using the http package:

// ```dart
// import 'package:http/http.dart' as http;
// Future<http.Response> postRequest() async {
//   final response = await http.post(
//     Uri.parse('https://jsonplaceholder.typicode.com/posts'),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(<String, String>{
//       'title': 'foo',
//       'body': 'bar',
//       'userId': '1',
//     }),
//   );
//   return response;
// }
// ```

// I hope this helps! Let me know if you have any other questions.

// Source: Conversation with Bing, 06/05/2023
// (1) Using API Requests with HTTP Package in Flutter and Dart. https://www.allaboutflutter.com/using-api-requests-with-http-package-in-flutter-and-dart.
// (2) HTTP Flutter Requests | Fetching Data From Server Through API URL. https://www.fluttertpoint.com/http-flutter.
// (3) Flutter — all you need to know about the http package. https://quoeamaster.medium.com/flutter-all-you-need-to-know-about-the-http-package-56de74e40ecb.
// (4) Accessing REST API in Flutter with HTTP package. https://stackoverflow.com/questions/66614286/accessing-rest-api-in-flutter-with-http-package.