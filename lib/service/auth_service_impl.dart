import 'package:hello_world/service/auth_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthServiceImpl implements AuthService{
  @override
  storeToken(String token) {
    // TODO: implement storeToken
    FlutterSecureStorage().write(key: "user_token", value: token);
    print("user_token stored");
    return null;
  }
}