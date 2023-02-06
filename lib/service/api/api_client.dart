import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:elm/utils/utils.dart';
import 'package:http/http.dart' as http;

import '../../constant/value.dart';
import 'api_exception.dart';

class ApiClient {
  //GET
  Future<dynamic> get(String endPoint) async {
    var uri = Uri.parse(baseUrl + endPoint);
    print(uri);
    try {
      var response = await http.get(uri).timeout(Duration(seconds: 20));
      return _processResponse(response);
    } on SocketException {
      throw ProcessDataException("No internet connection", uri.toString());
    } on TimeoutException {
      throw ProcessDataException("Not responding in time", uri.toString());
    }
  }

  //POST
  Future<dynamic> post(String endPoint, dynamic payloadObj,
      {dynamic header}) async {
    var uri = Uri.parse(baseUrl + endPoint);
    try {
      var response = await http
          .post(uri, body: payloadObj, headers: header)
          .timeout(Duration(seconds: 20));
      return _processResponse(response);
    } on SocketException {
      throw ProcessDataException("No internet connection", uri.toString());
    } on TimeoutException {
      throw ProcessDataException("Not responding in time", uri.toString());
    }
  }

  //PUT
  Future<dynamic> put(String endPoint, dynamic payloadObj,
      {dynamic header}) async {
    var uri = Uri.parse(baseUrl + endPoint);
    try {
      var response = await http
          .put(uri, body: payloadObj, headers: header)
          .timeout(Duration(seconds: 20));
      return _processResponse(response);
    } on SocketException {
      throw ProcessDataException("No internet connection", uri.toString());
    } on TimeoutException {
      throw ProcessDataException("Not responding in time", uri.toString());
    }
  }

  //DELETE

  dynamic _processResponse(http.Response response) {
    var jsonResponse = utf8.decode(response.bodyBytes);
    print(response.body);
    print(response.statusCode);
    print(response.request!.url);
    switch (response.statusCode) {
      case 200:
        return jsonResponse;
      case 201:
        return jsonResponse;
      case 400:
        throw BadRequestException(
            jsonResponse, response.request!.url.toString());
      case 500:
        throw BadRequestException(
            jsonResponse, response.request!.url.toString());
      default:
        throw ProcessDataException(
            "Error occurred with code ${response.statusCode}",
            response.request!.url.toString());
    }
  }
}
