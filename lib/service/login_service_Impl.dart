import 'dart:convert';

import 'package:global_configuration/global_configuration.dart';
import 'package:hello_world/service/login_service.dart';
import 'package:http/http.dart' as http;

class LoginServiceImpl implements LoginService {
  @override
  Future<http.Response> doLogin(String login, String password) async {
    // TODO: implement doLogin
    print('fazendo login... '+login+'-'+password );
    return await http.post(
      GlobalConfiguration().getString("LOGIN_URL"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
          "login": login,
          "pswd": password
      }),
    );
  }
}
