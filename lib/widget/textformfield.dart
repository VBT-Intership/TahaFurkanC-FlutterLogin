import 'package:flutter/material.dart';

class TextFormFieldWidget {
  bool _isHidden = true;

  TextFormField buildTextFormField(String labelText) {
    return TextFormField(
      validator: (value) {
        return validatorEmailandPassword(labelText, value);
      },
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          color: Colors.grey,
          fontSize: 20.0,
        ),
        suffixIcon: labelText == "Password"
            ? FlatButton(
                onPressed: () {},
                child: Text("Forgot Password ?"),
                textColor: Colors.blue,
              )
            : null,
      ),
      obscureText: labelText == "Password" ? _isHidden : false,
    );
  }

  String validatorEmailandPassword(String labelText, String value) {
    if (labelText == "Email address") {
      Pattern pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regex = new RegExp(pattern);
      if (!regex.hasMatch(value))
        return 'Enter Valid Email';
      else
        return null;
    } else {
      if (value.length < 8) {
        return 'The password must be 8 characters or more.';
      } else {
        return null;
      }
    }
  }
}
