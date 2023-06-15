import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../models/response_item.dart';
import 'api_exception.dart';

class BaseApiHelper {
  static Future<dynamic> postRequest(String requestUrl, Map<String, dynamic> requestData) async {
    log("request:$requestUrl");
    // log("headers:${requestHeader()}");
    log("body:${json.encode(requestData)}");
    return await http.post(Uri.parse(requestUrl), body: requestData,
          // encoding: Encoding.getByName('utf-8'),
          // headers: requestHeader()
        ).then((response) => onValue(response)).onError((error, stackTrace) => onError(error));
  }

  static Future<dynamic> getRequest(String requestUrl, {Map<String, dynamic>? params}) async {
    log("request:$requestUrl");
    // log("headers:${requestHeader(passAuthToken)}");

    return await http.get(Uri.parse(requestUrl),
          // headers: requestHeader(passAuthToken)
        )
        .then((response) => onValue(response))
        .onError((error, stackTrace) => onError(error));
  }

  static Future<ResponseItem> deleteRequest(String requestUrl, bool passAuthToken) async {
    log("request:$requestUrl");
    // log("headers:${requestHeader(passAuthToken)}");

    return await http
        .delete(
          Uri.parse(requestUrl),
          // headers: requestHeader(passAuthToken)
        ).then((response) => onValue(response)).onError((error, stackTrace) => onError(error));
  }

  static Future<ResponseItem> patchRequest(String requestUrl, Map<String, dynamic> requestData, bool passAuthToken) async {
    log("request:$requestUrl");
    // log("headers:${requestHeader(passAuthToken)}");

    return await http.patch(Uri.parse(requestUrl), body: json.encode(requestData),
          // headers: requestHeader(passAuthToken)
        ).then((response) => onValue(response)).onError((error, stackTrace) => onError(error));
  }

  static Future<ResponseItem> uploadFile(
      String requestUrl,
      http.MultipartFile? profileImage,
      List<http.MultipartFile> plantImages,
      Map<String, String> requestData, {List<http.MultipartFile> multipleFiles = const []}) async {
    var request = http.MultipartRequest("POST", Uri.parse(requestUrl));

    if (profileImage != null) request.files.add(profileImage);
    if (plantImages.isNotEmpty) request.files.addAll(plantImages);
    if (multipleFiles.isNotEmpty) {
      request.files.addAll(multipleFiles);
    }
    // request.headers.addAll(requestHeader(true));
    request.fields.addAll(requestData);

    log(request.toString(), name: "REQUEST");
    // log(profileImage!.field.toString());
    log("body:${json.encode(requestData)}");
    return await request.send().then((streamedResponse) {
      return http.Response.fromStream(streamedResponse).then((value) => onValue(value));
    }).onError((error, stackTrace) => onError(error));
  }

  String base64Decode(String encoded) {
    return utf8.decode(base64.decode(encoded));
  }

  static Future onValue(http.Response response) async {
    log(response.statusCode.toString());
    log(response.body.toString());

    dynamic result;

    // final ResponseItem responseData =
    //     ResponseItem.fromJson(json.decode(response.body));
    // String status;
    String message;
    // // bool verify = true;

    // dynamic fullData = responseData.fullData;
    dynamic data = response.body;
    bool responseSuscces = false;
    log("responseCode---: ${response.statusCode}", name: "response");
    if (response.statusCode == 200) {
      // message = responseData.message;
      responseSuscces = true;

      // data = responseData.data;
      // verify = responseData.isVerify ?? true;
      result = data;
      // print("result DataType ------> ${result.runtimeType}");
      log("susccess");
      return result;
    } else {
      log("response: $data");
      responseSuscces;
      message = "Something went wrong.";
      return null;
    }
    // result = data;
    //
    // log("message: {result.message}");
    // return result;
  }

  // static Future baseOnValue(http.Response response) async {
  //   ResponseItem result;
  //   final Map<String, dynamic> responseData = json.decode(response.body);
  //   String status;
  //   String message;
  //   dynamic data = responseData;
  //
  //   log("responseCode: ${response.statusCode}");
  //   if (response.statusCode == 200) {
  //     message = "Ok";
  //     status = "Success";
  //     data = responseData;
  //   } else {
  //     log("response: $data", name: 'error');
  //     message = "Something went wrong.";
  //   }
  //   result = ResponseItem(data: data, message: message, status: status);
  //   log("response: {data: ${result.data}, message: $message, status: $status}",
  //       name: APP_NAME);
  //   return result;
  // }

  static onError(error) {
    log("Error caused: $error");
    String status = "failed";
    String message = "Unsuccessful request";
    if (error is SocketException) {
      message = ResponseException("No internet connection").toString();
    } else if (error is FormatException) {
      message = ResponseException("Something wrong in response.").toString() +
          error.toString();
    }
    return ResponseItem(data: null, message: message, status: status);
  }
}
