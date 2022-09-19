import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Policy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Policy and Fiar Use'),
        backgroundColor: Colors.red[900],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                  'This application is developed strictly for the purpose of mitigating the effects of the current pandemic. This app should not be used to slate any specific political parties, religious groups, castes or community and should strictly be used for the welfare of our community. ',
                  style: TextStyle(
                    fontSize: 18,
                  )),
            )
          ],
        ),
      ),
    );
  }

  void backToMainPage(context) {
    Navigator.pop(context);
  }
}
