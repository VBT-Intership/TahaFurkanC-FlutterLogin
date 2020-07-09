import 'package:flutter/material.dart';
import 'package:login_screen/screens/welcomescreen.dart';
import 'package:login_screen/widget/textformfield.dart';
import 'package:login_screen/widget/textwitgetwithpadding.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isAutoValidate = false;
  var formKey = GlobalKey<FormState>();
  TextWidgetWithPadding txt = TextWidgetWithPadding();
  TextFormFieldWidget txtForm = TextFormFieldWidget();
  final InputDecoration decoration = InputDecoration(
    border: OutlineInputBorder(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 100.0, left: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                txt.buildTextWidgetWithPadding(
                    "VBT", 24, Colors.blue, FontWeight.bold),
                buildIcon()
              ],
            ),
            Text("Employee Login"),
            txt.buildTextWidgetWithPadding(
                "Welcome!", 40, Colors.black, FontWeight.w300,
                padding: 20),
            txt.buildTextWidgetWithPadding("Please Sing-in to Continue", 16,
                Colors.black, FontWeight.normal),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Form(
                autovalidate: isAutoValidate,
                key: formKey,
                child: Column(
                  children: <Widget>[
                    txtForm.buildTextFormField("Email address"),
                    txtForm.buildTextFormField("Password"),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: buildSingButtonButton(),
            )
          ],
        ),
      ),
    ));
  }

  Icon buildIcon() {
    return Icon(
      Icons.arrow_forward_ios,
      color: Colors.blueAccent,
    );
  }

  ButtonTheme buildSingButtonButton() {
    return ButtonTheme(
      height: 40,
      minWidth: 110,
      child: RaisedButton(
        onPressed: () {
          if (formKey.currentState.validate()) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => WelcomeScreen()));
          } else {
            setState(() {
              isAutoValidate = true;
            });
          }
        },
        child: Text("Sign In"),
        color: Colors.blue,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}
