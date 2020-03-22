
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/FormButton.dart';

class Login extends StatefulWidget {
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: _loginForm(),
    );
  }

  Widget _loginForm() {
    final _formKey = GlobalKey<FormState>();
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/6th-place_small-white-hair-spider_javier-ruperez_nikon-small-world.jpg"),
          fit: BoxFit.cover,
        )
      ),
        alignment: Alignment.center,
        child: FractionallySizedBox(
            widthFactor: 0.80,
            heightFactor: 0.50,
            child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Campo vazio ou inválido';
                        }
                      },
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.edit),
                        labelText: 'Login',
                        hintText: 'Insira seu email',
                      ),
                    ),
                    TextFormField(
                      obscureText: true,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Campo vazio ou inválido';
                        }
                      },
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.visibility_off),
                        labelText: 'Senha',
                        hintText: 'Insira sua senha',
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 26.0),
                        child: FormButton(_formKey, "Login"))
                  ],
                )
            )
        )
    );
  }
}
