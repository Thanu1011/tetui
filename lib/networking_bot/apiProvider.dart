import 'package:fluttertui_app/networking_bot/customException.dart';
import 'package:dio/dio.dart';

import 'dart:async';


class ApiProvider {
  //HEROKU version
  final String _baseUrl = 'https://fastapi-001.herokuapp.com';

  //LOCAL VERSION
  //final String _baseUrl = 'http://0.0.0.0:8008';

  //get Method
  Future<dynamic> get(String url, String usr) async {
    var responseJson;

    String theUrl = _baseUrl + url + usr;

    print('----------------' + 'Enter: /networking/ApiProvider.get ' + theUrl);

    try {
      Response response = await Dio().get(theUrl);

      responseJson = _response(response);
    } catch (e) {
      print('Error: ${e}');
    }

    return responseJson;
  }

  //post Method
  Future<dynamic> post(String url, Map payLoad) async {
    Map<String, dynamic> responseJson;

    String theUrl = _baseUrl + url;


    print('----------------' + 'Enter: /networking/ApiProvider.post ' + theUrl);

    try {
      //Http.Response response = await Http.post(theUrl, headers: headers, body: payLoad);
      Dio dio = new Dio();

      //Set default config
      dio.options.followRedirects = true;
      dio.options.contentType = "application/json";
      dio.options.headers = {
        "Connection": "keep-alive",
        "Accept": "application/json"
      };

      Response response = await dio.post(theUrl, data: payLoad);

      print(response.data.toString());

      responseJson = _response(response);
    } catch (e) {
      print('Error: ${e}');
    }

    return responseJson;
  }

  Map<String, dynamic> _response(Response response) {
    switch (response.statusCode) {
      case 200:
        print('----------------' +
            '/networking/ApiProvider._response.statusCode=' +
            response.statusCode.toString());
        return response.data;
      case 400:
        throw BadRequestException(response.data.toString());
      case 401:

      case 403:
        throw UnauthorisedException(response.data.toString());
      case 500:

      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}