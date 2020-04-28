
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/pages/home.dart';
import 'pages/login.dart';
import 'pages/signin.dart';
import 'package:global_configuration/global_configuration.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GlobalConfiguration().loadFromPath("assets/config/app_config.json");
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Notas",
    initialRoute: '/',
    routes: {
      '/': (context) => Login(),
      '/home': (context) => Home(),
      '/signin': (context) => Signin()
    },
  ));
}
