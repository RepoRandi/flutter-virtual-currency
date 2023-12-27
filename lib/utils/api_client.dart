import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiClient {
  static String baseUrl = 'http://test-tech.api.jtisrv.com/md/public';

  static Future<http.Response> get(
      String endPoint, String cookie, Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('$baseUrl/$endPoint'),
      headers: <String, String>{
        'Cookie': cookie,
        'Content-Type': 'application/json'
      },
      body: jsonEncode(data),
    );
    return response;
  }

  static Future<http.Response> post(
      String endPoint, String cookie, Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('$baseUrl/$endPoint'),
      headers: <String, String>{
        'Cookie': cookie,
        'Content-Type': 'application/json'
      },
      body: jsonEncode(data),
    );
    return response;
  }
}
