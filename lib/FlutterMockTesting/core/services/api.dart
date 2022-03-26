import 'dart:convert';

import 'package:all_flutter_gives/FlutterMockTesting/core/models/product.dart';
import 'package:all_flutter_gives/FlutterMockTesting/helpers/constants.dart';
import 'package:http/http.dart' as http;

class API {
  static const endpoint = URL.ProductList;

  var client = new http.Client();

  Future<List<Product>> getProducts() async {
    var products = List<Product>();
    var response = await client.get(Uri.parse('$endpoint' + 'products.json'));

    var data = json.decode(response.body) as List<dynamic>;

    for (var product in data) {
      products.add(Product.fromJson(product));
    }

    return products;
  }
}
