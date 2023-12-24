import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:mnjz_task/features/home/data/models/producat%20_model.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/strings/keys.dart';
import '../../../../utile/network/local/cache_helper.dart';

abstract class ProductLocalDataSource {
  Future<List<ProductsModel>> getCachedProductList();

  Future<Unit> cacheProductList(List<ProductsModel> productList);
}

class ProductLocalDataSourceImp implements ProductLocalDataSource {
  @override
  Future<Unit> cacheProductList(List<ProductsModel> productList) {
    List duahModelsToJson = productList
        .map<Map<String, dynamic>>((productModel) => productModel.toJson())
        .toList();
    CacheHelper.saveData(
        key: productCachedKey, value: jsonEncode(duahModelsToJson));

    return Future.value(unit);
  }

  @override
  Future<List<ProductsModel>> getCachedProductList() {
    final jsonString = CacheHelper.getData(key: productCachedKey);
    print("jsonString $jsonString");
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<ProductsModel> jsonToProductsModels = decodeJsonData
          .map<ProductsModel>(
              (jsonProductsModel) => ProductsModel.fromJson(jsonProductsModel))
          .toList();
      return Future.value(jsonToProductsModels);
    } else {
      print("Nnnnnnnn");
      throw EmptyCacheException();
    }
  }
}
