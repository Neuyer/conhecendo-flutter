class LoginResponse{
  String auth;
  String token;

  LoginResponse(this.auth, this.token);

  String getToken(){
    return token;
  }

  String getAuth(){
    return auth;
  }
}