import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:http/http.dart' as http;

import '../../Constants/utils.dart';
import '../../common/constants.dart';

import '../app_exceptions.dart';
import 'base_api_services.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future<dynamic> getApi(String url) async {
    Utils.printLog(url);
    dynamic responseJson;
    String token = await Utils.getPreferenceValues(Constants.accessToken) ?? "";

    try {
      final response = await http.get(Uri.parse(url), headers: {
        'content-Type': 'application/json',
        'accesstoken': token,
      }).timeout(const Duration(seconds: 600));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    } on TimeoutException {
      throw RequestTimeOut('');
    } on UnauthorizedException {
      throw AuthenticationException('');
    }
    Utils.printLog(responseJson);

    return responseJson;
  }

  @override
  Future<dynamic> getApiWithParameter(
      var page, var status, var search, String url) async {
    Utils.printLog(url);
    dynamic responseJson;
    String token = await Utils.getPreferenceValues(Constants.accessToken) ?? "";

    try {
      final uri = Uri.parse(url).replace(
          queryParameters: {'page': page, 'status': status, 'search': search});
      final response = await http.get(uri, headers: {
        'Accept': 'application/json',
        'Authorization': token,
      }).timeout(const Duration(seconds: 600));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    } on TimeoutException {
      throw RequestTimeOut('');
    } on UnauthorizedException {
      throw AuthenticationException('');
    }
    Utils.printLog(responseJson);

    return responseJson;
  }

  @override
  Future<dynamic> postApi(var data, String url) async {
    Utils.printLog(url);
    Utils.printLog(data);
    dynamic responseJson;
    String token = await Utils.getPreferenceValues(Constants.accessToken) ?? "";

    try {
      final response = await http
          .post(
            Uri.parse(url),
            headers: {
              'Accept': 'application/json',
              'Authorization': token,
            },
            body:
                data, //jsonEncode(data) //if raw form then we set jsonEncode if form the only data
          )
          .timeout(const Duration(seconds: 600));
      responseJson = returnResponse(response);
      Utils.printLog('Response: $response');
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    } on TimeoutException {
      throw RequestTimeOut('');
    } on UnauthorizedException {
      throw AuthenticationException('');
    }
    Utils.printLog(responseJson);
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw InvalidUrlException();
      case 401:
        throw AuthenticationException('');
      case 408:
        throw FetchDataException(response.body);
      case 409:
        throw FetchDataException(response.body);
      default:
        throw FetchDataException(' ${response.body}');
    }
  }

  Future<dynamic> multiPartMediaApi(
      var data, String url, List<String> paths, List<String> keys) async {
    Utils.printLog(url);
    Utils.printLog(data);
    Utils.printLog(paths);
    dynamic responseJson;
    String token = await Utils.getPreferenceValues(Constants.accessToken) ?? "";

    try {
      if (paths.isEmpty) {
        // If no images to upload, send a normal POST request
        final response = await http
            .post(
              Uri.parse(url),
              headers: {
                'Content-Type': 'application/json',
                'accesstoken': token,
              },
              body: data, // use jsonEncode if sending JSON data
            )
            .timeout(const Duration(seconds: 600));
        responseJson = returnResponse(response);
      } else {
        // Create MultipartRequest for uploading files
        var request = http.MultipartRequest("POST", Uri.parse(url));

        // Add data fields if provided
        if (data != null) {
          data.forEach((key, value) {
            request.fields[key] = value;
          });
        }

        request.headers['accesstoken'] = token;

        // Ensure the number of keys matches the number of paths
        if (keys.length != paths.length) {
          throw Exception(
              'The number of keys must match the number of image paths');
        }

        // Add each image with its corresponding key as MultipartFile
        for (int i = 0; i < paths.length; i++) {
          String path = paths[i];
          String key = keys[i];
          if (path.isNotEmpty) {
            request.files.add(http.MultipartFile(key,
                File(path).readAsBytes().asStream(), File(path).lengthSync(),
                filename:
                    path.split('/').last)); // Use the filename from the path
          }
        }

        // Send the request and get the response
        final response = await request.send();
        final responseHttp = await http.Response.fromStream(response);
        responseJson = returnResponse(responseHttp);
      }
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    } on TimeoutException {
      throw RequestTimeOut('');
    } on UnauthorizedException {
      throw AuthenticationException('');
    }

    Utils.printLog(responseJson);
    return responseJson;
  }

  @override
  Future<dynamic> multiPartApi(
      var data, String url, String path, var keys) async {
    Utils.printLog(url);
    Utils.printLog(data);
    Utils.printLog(path);
    dynamic responseJson;
    String token = await Utils.getPreferenceValues(Constants.accessToken) ?? "";

    try {
      if (path == '') {
        final response = await http
            .post(
              Uri.parse(url),
              headers: {
                'content-Type': 'application/json',
                'accesstoken': token,
              },
              body:
                  data, //jsonEncode(data) //if raw form then we set jsonEncode if form the only data
            )
            .timeout(const Duration(seconds: 600));
        responseJson = returnResponse(response);
      } else {
        var request = http.MultipartRequest("POST", Uri.parse(url));
        if (data != null) {
          for (int i = 0; i < data.length; i++) {
            String key = data.keys.elementAt(i);
            request.fields[key] = data[key];
          }
        }
        request.headers['accesstoken'] = token;
        request.files.add(http.MultipartFile(
            keys, File(path).readAsBytes().asStream(), File(path).lengthSync(),
            filename: 'profile-image.png'));
        final response = await request.send();
        final responseHttp = await http.Response.fromStream(response);
        responseJson = returnResponse(responseHttp);
      }
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    } on TimeoutException {
      throw RequestTimeOut('');
    } on UnauthorizedException {
      throw AuthenticationException('');
    }
    Utils.printLog(responseJson);
    return responseJson;
  }

  @override
  Future postEncodeApi(data, String url) async {
    Utils.printLog(url);
    Utils.printLog(data);
    dynamic responseJson;
    String token = await Utils.getPreferenceValues(Constants.accessToken) ?? "";

    try {
      final response = await http
          .post(
            Uri.parse(url),
            headers: {
              'content-Type': "application/json",
              'accesstoken': token,
            },
            body: jsonEncode(
                data), //jsonEncode(data) //if raw form then we set jsonEncode if form the only data
          )
          .timeout(const Duration(seconds: 600));
      responseJson = returnResponse(response);
      Utils.printLog('Response: $response');
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    } on TimeoutException {
      throw RequestTimeOut('');
    } on UnauthorizedException {
      throw AuthenticationException('');
    }
    Utils.printLog(responseJson);
    return responseJson;
  }

  Future postEncodeApiForFCM(data, String url) async {
    Utils.printLog(url);
    Utils.printLog(data);
    dynamic responseJson;
    String token = await Utils.getPreferenceValues(Constants.accessToken) ?? "";

    try {
      final response = await http
          .post(
            Uri.parse(url),
            headers: {
              'content-Type': "application/json",
              'accesstoken': token,
              'devicetype': "ANDROID"
            },

            body: jsonEncode(
                data), //jsonEncode(data) //if raw form then we set jsonEncode if form the only data
          )
          .timeout(const Duration(seconds: 600));
      responseJson = returnResponse(response);
      Utils.printLog('Response: $response');
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    } on TimeoutException {
      throw RequestTimeOut('');
    } on UnauthorizedException {
      throw AuthenticationException('');
    }
    Utils.printLog(responseJson);
    return responseJson;
  }
}
