import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'app_exception.dart';

class ApiBaseHelper {
  final Dio _dio;
  //1 هاذا بيكون مشتركة عنوان
  final String _baseUrl = "https://www.googleapis.com/books/v1/";

  ApiBaseHelper(this._dio);
//2 url هاذا هنا بتكون عبارة عن END POINRTE
  // DATA الي راحع عبارة عن  Map<String, String>

  Future<dynamic> get(String url) async {
    var responseJson;
    try {
      // هنا هتكون عبارة عن عنوان URL + END POINTE
      final response =
          await http.get(Uri.parse(_baseUrl + url));
      responseJson = _returnResponse(response);
       // هنا اذا صار في غلط ابعت اللغلط الي صار
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> post(String url, Map<String, String> header,Map<String, String> body) async {
    var responseJson;
    try {
      final response = await http.post(
        Uri.parse(_baseUrl + url),
        headers: header,
        body: body,
      );

      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }


  Future<dynamic> delete(String url, Map<String, String> header,Map<String, String> body) async {
    var responseJson;
    try {
      final response = await http.delete(
        Uri.parse(_baseUrl + url),
        headers: header,
        body: body,
      );

      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }
  Future<dynamic> put(String url, Map<String, dynamic> body) async {
    var responseJson;
    // String? token = ShPreferences.getToken();

    try {
      final response = await http.put(
        Uri.parse(_baseUrl + url),headers: {
          // 'Authorization': 'Bearer $token',
        },
        body: body,
      );
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
