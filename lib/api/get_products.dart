import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:insurease/notifiers/productType.dart';

import '../models/ProductType_model.dart';

const String baseUrl = 'api.grow.curacel.co';
const String path = '/api/v1/product-types';
const  String apiKey =
    '903c2a641e5a3e51f38a0dbc8349cb811562375cdc276b16bed93b6cc7ad7e3d';

getProductTypes(ProductTypeNotifier productType) async {
  final url = Uri.https(baseUrl, path);
  final response = await http.get(url, headers: {
    'Accept': 'application/json',
    'Authorization': apiKey,
  });

  List<ProductTypeModel> productTypeList = [];

  if (response.statusCode == 200) {
    final responseBody = jsonDecode(response.body);
    final data = responseBody['data'];
    for (final item in data) {
      ProductTypeModel prod = ProductTypeModel.fromMap(item);
      productTypeList.add(prod);
    }
    productType.productList = productTypeList;

    return true;
  } else {
    throw Exception('Failed to get product types');
  }
}

