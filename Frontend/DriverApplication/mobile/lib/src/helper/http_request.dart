import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_user_agent/flutter_user_agent.dart';
import '../resources/constants.dart';

class HttpRequest {

  static httpPost(requestHeader, requestBody, url) async {
    var userAgent = await FlutterUserAgent.getPropertyAsync('userAgent');
    requestHeader["User-Agent"] = '${Constants.USER_AGENT_ANDROID} $userAgent';
    print('Sending post request to $url');
    var response = await http.post(
      url, 
      headers:requestHeader, 
      body:json.encode(requestBody)
    );

    print('Receiving response from $url'); 
    return response;
  }

  static httpPut(requestHeader, requestBody, url) async {
    var userAgent = await FlutterUserAgent.getPropertyAsync('userAgent');
    requestHeader["User-Agent"] = '${Constants.USER_AGENT_ANDROID} $userAgent';
    print('Sending put request to $url');
    var response = await http.put(
      url, 
      headers:requestHeader, 
      body:json.encode(requestBody)
    );

    print('Receiving response from $url'); 
    return response;
  }

  static httpGet(requestHeader, url) async {
    var userAgent = await FlutterUserAgent.getPropertyAsync('userAgent');
    requestHeader["User-Agent"] = '${Constants.USER_AGENT_ANDROID} $userAgent';
    print('Sending get request to $url');
    var response = await http.get(url, headers: requestHeader);
    print('Receiving response from $url');
    return response;
  }

  static httpDelete(requestHeader, url) async {
    var userAgent = await FlutterUserAgent.getPropertyAsync('userAgent');
    requestHeader["User-Agent"] = '${Constants.USER_AGENT_ANDROID} $userAgent';
    print('Sending delete request to $url');
    var response = await http.delete(url, headers: requestHeader);
    print('Receiving response from $url');
    return response;
  }
}