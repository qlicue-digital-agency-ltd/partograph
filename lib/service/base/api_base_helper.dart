import 'dart:convert';
import 'dart:io';

import 'package:partograph/constants/api.dart';

import 'app_exceptions.dart';
import 'package:http/http.dart';

class ApiBaseHelper {
  Future<dynamic> getData(String url) async {
    dynamic responseJson;
    try {
      Response response = await get(Uri.parse(partographServerAPI + url));
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> deleteData(String url) async {
    dynamic responseJson;
    try {
      Response response = await delete(Uri.parse(partographServerAPI + url));
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<void> postData({required String data, required String url}) async {
    Map<String, String> _headers = {"Content-Type": "application/json"};
    try {
      Response response = await post(Uri.parse(partographServerAPI + url),
          body: data, headers: _headers);
      _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future<void> putData({required String data, required String url}) async {
    Map<String, String> _headers = {"Content-Type": "application/json"};
    try {
      Response response = await put(Uri.parse(partographServerAPI + url),
          body: data, headers: _headers);
      _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future<dynamic> postDataWithReturns(
      {required String data, required String url}) async {
    Map<String, String> _headers = {"Content-Type": "application/json"};
    dynamic responseJson;
    try {
      Response response = await post(Uri.parse(partographServerAPI + url),
          body: data, headers: _headers);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _returnResponse(Response response) {
    print(response.body);
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body);

        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
