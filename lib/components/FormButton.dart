import 'dart:developer';

import 'package:flutter/material.dart';

Widget FormButton(formKey, text) {
  return (RaisedButton(
    child: Text(text),
    onPressed: () {
      if (formKey.currentState.validate()) {
        return null;
      }
      return;
    },
    onLongPress: () {
    },
    padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
    textTheme: ButtonTextTheme.normal,
    elevation: 5,
  ));
}
