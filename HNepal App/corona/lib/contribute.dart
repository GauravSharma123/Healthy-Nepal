import 'package:flutter/material.dart';

class Contribute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contribute'),
        backgroundColor: Colors.red[900],
      ),
      body: Container(),
    );
  }

  void backToMainPage(context) {
    Navigator.pop(context);
  }
}
