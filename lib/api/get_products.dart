import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:insurease/notifiers/productType.dart';

import '../models/ProductType_model.dart';

const String baseUrl = 'api.playbox.grow.curacel.co';
const String path = '/api/v1/product-types';
const String apiKey =
    '903c2a641e5a3e51f38a0dbc8349cb811562375cdc276b16bed93b6cc7ad7e3d';

getProductTypes(ProductTypeNotifier productType) async {
  final url = Uri.https(baseUrl, path);
  final response = await http.get(url, headers: {
    'Accept': 'application/json',
    'Authorization': apiKey,
  });

  List<ProductTypeModel> _productTypeList = [];

  if (response.statusCode == 200) {
    final responseBody = jsonDecode(response.body);
    final data = responseBody['data'];
    for (final item in data) {
      ProductTypeModel prod = ProductTypeModel.fromMap(item);
      _productTypeList.add(prod);
    }
    productType.productList = _productTypeList;
  } else {
    throw Exception('Failed to get product types');
  }
}

// import 'dart:convert';
// import 'package:http/http.dart' as http;

// final String url = 'https://api.playbox.grow.curacel.co/api/v1/product-types';

// final headers = {
//   'accept': 'application/json',
//   'authorization': 'Bearer token'
// };

// Future<Map<String, dynamic>> getProductTypes() async {
//   final response = await http.get(Uri.parse(url), headers: headers);
//   final responseBody = jsonDecode(response.body);
//   return responseBody;
// }
