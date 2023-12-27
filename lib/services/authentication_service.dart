import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:virtual_currency/core.dart';

class AuthenticationService {
  Future<String?> login() async {
    final response = await http.post(
      Uri.parse('http://test-tech.api.jtisrv.com/md/public/API/Auth'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'act': 'LOGIN',
        'un': 'admin@admin.com',
        'up': 'admin',
      }),
    );

    if (response.statusCode == 200) {
      return response.headers['set-cookie'];
    } else {
      throw Exception('Failed to login');
    }
  }

  final SessionService sessionService = SessionService();

  Future<Map> backgroundHit() async {
    String? cookie = await sessionService.getSession('cookie');

    final response = await http.post(
      Uri.parse('http://test-tech.api.jtisrv.com/md/public/API/BgService/Hit'),
      headers: <String, String>{
        'Cookie': cookie!,
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        "nama": "randi",
        "email": "devs.randi@mail.com",
        "nohp": "081934644920"
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to background hit');
    }
  }
}
