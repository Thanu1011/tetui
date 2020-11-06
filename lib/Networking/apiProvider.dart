import 'package:dio/dio.dart';

import 'dart:async';

class ApiProvider {
  //HEROKU version
  final String _baseUrl = 'https://fastapi-001.herokuapp.com';

  //LOCAL VERSION
  //final String _baseUrl = 'http://0.0.0.0:8008';

  //get Method
  Future<dynamic> get(String url, String usr) async {
    String theUrl = _baseUrl + url + usr;

    final response = await Dio().get(theUrl);

    if (response.statusCode == 200) {
      Map<String, dynamic> map = response.data;

      return map;
    } else {
      throw Exception("Error fetching GET");
    }
  }

  //post  Method
  Future<dynamic> post(String url, Map payLoad) async {
    String theUrl = _baseUrl + url;

    //Http.Response response = await Http.post(theUrl, headers: headers, body: payLoad);
    Dio dio = new Dio();

    //Set default config
    dio.options.followRedirects = true;
    dio.options.contentType = "application/json";
    dio.options.headers = {
      "Connection": "keep-alive",
      "Accept": "application/json"
    };

    final response = await dio.post(theUrl, data: payLoad);

    if (response.statusCode == 200) {
      Map<String, dynamic> map = response.data;

      return map;
    } else {
      throw Exception("Error fetching POST");
    }
  }
}
