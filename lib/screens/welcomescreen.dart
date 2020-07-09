import 'package:flutter/material.dart';
import 'package:login_screen/widget/textwitgetwithpadding.dart';

class WelcomeScreen extends StatelessWidget {
  TextWidgetWithPadding txt = TextWidgetWithPadding();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: buildWelcomeScreen());
  }

  Widget buildWelcomeScreen() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          buildImage(),
          txt.buildTextWidgetWithPadding(
              "Sing In succesful!", 20, Colors.black, FontWeight.normal,
              align: TextAlign.center),
          txt.buildTextWidgetWithPadding(
              "Welcome to VBT", 40, Colors.black, FontWeight.normal,
              align: TextAlign.center),
        ],
      ),
    );
  }

  Image buildImage() {
    return Image.network(
      'https://www.vbt.com.tr/Assets/img/logo.png',
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes
                : null,
          ),
        );
      },
    );
  }
}
