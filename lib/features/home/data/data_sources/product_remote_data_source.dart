import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/end_points.dart';
import '../models/producat _model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductsModel>> getProductList();
}

class ProductRemoteDataSourceImp implements ProductRemoteDataSource {
  @override
  Future<List<ProductsModel>> getProductList() async {
    try {
      var request = http.Request('GET', Uri.parse(GET_PRODUCTS));

      http.StreamedResponse response = await request.send();
      String body = await response.stream.bytesToString();
      if (response.statusCode == 200) {
        List<ProductsModel> result = [];
        result = productFromJson(body);
        return result;
      } else {
        throw ServerException();
      }
    } catch (e) {
      if (kDebugMode) {
        print('error getProductList $e ');
      }

      throw ServerException();
    }
  }
}
