import 'package:flutter/foundation.dart';

import 'categories_model.dart';

class productsModel {
  int? id;
  String? title;
  int? price;
  String? description;
  List<String>? images;
  String? creationAt;
  String? updatedAt;
  CategoriesModel? category;

  productsModel(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.images,
      this.creationAt,
      this.updatedAt,
      this.category});

  productsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    images = json['images'].cast<String>();
    creationAt = json['creationAt'];
    updatedAt = json['updatedAt'];
    category = json['category'] != null
        ?  CategoriesModel .fromJson(json['category'])
        : null;
  }
  static List<productsModel> productsFromJson (List productJson){
    return productJson.map((data){
      print("$data");
      return productsModel.fromJson(data);
    }).toList();
  }
  
}
