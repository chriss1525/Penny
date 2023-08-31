import 'package:http/http.dart' as http;

import 'package:client/api/api.dart';

class AuthApi {
  final Api api;

  AuthApi(this.api);

  Future<http.Response> login(String email, String password) async {
    return await http.post(
      Uri.parse('${api.baseUrl}/login'),
      body: {
        'email': email,
        'password': password,
      },
    );
  }

  Future<http.Response> register(String email, String password) async {
    http.Response res = await http.post(
      Uri.parse('${api.baseUrl}/register'),
      body: {
        'email': email,
        'password': password,
      },
    );

    return res;
  }
}
