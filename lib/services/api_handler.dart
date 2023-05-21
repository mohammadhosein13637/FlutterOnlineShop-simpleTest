import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_api_flutter_course/models/products_model.dart';
class APIHandler {
  static Future<List<productsModel>> getAllProducts () async{
     var response = await http.get(Uri.parse('https://api.escuelajs.co/api/v1/products'));
     var data = jsonDecode(response.body);
     List tempList  = [];
     for( var item in data ){
      tempList.add(item);
     }
     return productsModel.productsFromJson(tempList);
  }
  
}