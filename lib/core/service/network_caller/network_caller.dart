import 'dart:convert';

import 'package:http/http.dart';
import 'package:logger/logger.dart';

part 'network_response.dart';

class NetworkCaller {
  final Logger _logger = Logger();

  final Map<String, String> Function() headers;

  NetworkCaller({required this.headers});

  // GET Request
  Future<NetworkResponse> getRequest(String url) async {
    try {
      Uri uri = Uri.parse(url);
      _logRequest(url);
      final Response response = await get(uri, headers: headers());
      _logResponse(response);

      if (response.statusCode == 200) {
        //Success
        final decodedJson = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          body: decodedJson,
        );
      } else {
        //Failed
        final decodedJson = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage: decodedJson["message"] ?? "Something went wrong!",
        );
      }
    } on Exception catch (e) {
      // TODO
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: e.toString(),
      );
    }
  }

  // POST Request
  Future<NetworkResponse> postRequest(String url, {Map<String, dynamic>? body}) async {
    try {
      Uri uri = Uri.parse(url);
      _logRequest(url, requestBody: body, headers: headers());
      final Response response = await post(
        uri,
        headers: {'content-type': 'application/json'},
        body: jsonEncode(body),
      );
      _logResponse(response);
      
      if (response.statusCode == 200 || response.statusCode == 201) {
        //Success
        final decodedJson = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          body: decodedJson,
        );
      } else {
        //Failed
        final decodedJson = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage: decodedJson["message"] ?? "Something went wrong!",
        );
      }
    } on Exception catch (e) {
      // TODO
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: e.toString(),
      );
    }
  }

  void _logRequest(
    String url, {
    Map<String, dynamic>? requestBody,
    Map<String, String>? headers,
  }) {
    _logger.d('''
      Url => $url
      Headers => $headers
      RequestBody => $requestBody
      ''');
  }

  void _logResponse(Response response) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      _logger.i('''
      Url => ${response.request?.url}
      Status Code => ${response.statusCode}
      RequestBody => ${response.body}
      ''');
    } else {
      _logger.e('''
      Url => ${response.request?.url}
      Status Code => ${response.statusCode}
      RequestBody => ${response.body}
      ''');
    }
  }
}


