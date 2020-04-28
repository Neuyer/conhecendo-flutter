import 'dart:convert';
import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hello_world/pages/signin.dart';
import 'package:hello_world/service/auth_service_impl.dart';
import 'package:http/http.dart';
import '../service/login_service_impl.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // injection
  static LoginServiceImpl Login_service = new LoginServiceImpl();
  static AuthServiceImpl _authServiceImpl = new AuthServiceImpl();

  //values
  static const _LoginContainerMArgin =
      EdgeInsets.only(left: 30, top: 60, right: 30);
  static const _defaultInputPadding =
      EdgeInsets.only(left: 10, top: 1, right: 10, bottom: 10);
  static const _defaultFieldsMargin = EdgeInsets.only(top: 20);
  static String _loginFieldValue;
  static String _passwordFieldValue;
  String _emptyLoginFieldAlert;
  String _emptyPasswordFieldAlert;
  bool _showLoadingGif = false;

  //logic
  _doLogin(BuildContext context, String login, String password) async {
    Response response = await Login_service.doLogin(login, password);
    var data = jsonDecode(response.body);
    _authServiceImpl.storeToken(data["token"]);
    setState(() {
      _showLoadingGif = false;
    });
  }

  _goToSignIn(BuildContext context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Signin()));
  }

  _showLoginFieldAlert(value) {
    setState(() {
      (value.isEmpty)
          ? _emptyLoginFieldAlert = 'Login inválido ou vazio'
          : _emptyLoginFieldAlert = null;
    });
  }

  _showPasswordFieldAlert(value) {
    setState(() {
      (value.isEmpty)
          ? _emptyPasswordFieldAlert = 'Senha inválida ou vazia'
          : _emptyPasswordFieldAlert = null;
    });
  }

  final spinkit = SpinKitDoubleBounce(
    color: Colors.purple,
    size: 50.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: Colors.purple,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                  height: 350,
                  margin: _LoginContainerMArgin,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromRGBO(1, 1, 1, 1.06),
                  ),
                  child: Form(
                      child: Column(
                    children: <Widget>[
                      Container(
                        margin: _defaultFieldsMargin,
                        child: Padding(
                          padding: _defaultInputPadding,
                          child: TextFormField(
                            decoration: InputDecoration(
                                labelText: 'Login',
                                errorText: _emptyLoginFieldAlert,
                                contentPadding: _defaultInputPadding),
                            onChanged: (value) {
                              _showLoginFieldAlert(value);
                              setState(() {
                                _loginFieldValue = value;
                              });
                            },
                          ),
                        ),
                      ),
                      Container(
                        margin: _defaultFieldsMargin,
                        child: Padding(
                          padding: _defaultInputPadding,
                          child: TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Senha',
                              errorText: _emptyPasswordFieldAlert,
                              contentPadding: _defaultInputPadding,
                            ),
                            onChanged: (value) {
                              _showPasswordFieldAlert(value);
                              setState(() {
                                _passwordFieldValue = value;
                              });
                            },
                          ),
                        ),
                      ),
                      Container(
                          margin: _defaultFieldsMargin,
                          child: RaisedButton(
                            color: Colors.purple,
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            textColor: Colors.red,
                            onPressed: () {
                              FocusScope.of(context).requestFocus(FocusNode());
                              _doLogin(context, _loginFieldValue,
                                  _passwordFieldValue);
                              setState(() {
                                _showLoadingGif = true;
                              });
                            },
                          )),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: FlatButton(
                          onPressed: () {
                            _goToSignIn(context);
                          },
                          child: Text('Ainda não tem cadastro?'),
                        ),
                      ),
                    ],
                  ))),
              Center(
                  heightFactor: 15,
                  child: Visibility(
                    visible: _showLoadingGif,
                    child: spinkit,
                  )
              ),
            ],
          )
        ],
      ),
    );
  }
}
