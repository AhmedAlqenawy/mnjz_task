import 'dart:convert';

import 'package:mnjz_task/features/home/data/models/rating%20_model.dart';

import '../../domain/entities/products_entity.dart';
List<ProductsModel> productFromJson(String str) => List<ProductsModel>.from(json.decode(str).map((x) => ProductsModel.fromJson(x)));

class ProductsModel extends ProductsEntity {
  const ProductsModel(
    super.id,
    super.title,
    super.price,
    super.description,
    super.category,
    super.image,
    super.rating,
  );

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      json['id'],
      json['title'],
      json['price']?.toDouble(),
      json['description'],
      json['category'],
      json['image'],
      RatingModel.fromJson(json['rating']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id']=id;
    json['title']=title;
    json['price']=price;
    json['description']=description;
    json['category']=category;
    json['image']=image;
    json['rating']=rating!.toJson();
    return json;
  }

}
