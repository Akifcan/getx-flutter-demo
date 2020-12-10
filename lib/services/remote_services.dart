import 'dart:convert';

import 'package:get_app/core/constants.dart';
import 'package:get_app/models/cat_model.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  static var client = http.Client();
  static Future<Iterable> fetchCats() async {
    var response = await client.get('$API_URL/facts');
    if (response.statusCode == 200) {
      List data = json.decode(response.body)['all'];
      Iterable<CatModel> cats =
          data.map((cat) => CatModel.fromJson(cat)).toList();
      return cats;
    } else {
      return null;
    }
  }
}
