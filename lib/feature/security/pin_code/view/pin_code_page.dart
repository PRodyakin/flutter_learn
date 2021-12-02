
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PinCodePage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => PinCodePage());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Text("Pin code"),
        ),
      ),
    );
  }
}
