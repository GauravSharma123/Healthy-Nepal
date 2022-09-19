import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class EmergencyHelp extends StatefulWidget {
  Prompt createState() => Prompt();
}

class Prompt extends State<EmergencyHelp> {
  var name;
  var phone;
  var blood;
  var location;
  final verifyname = TextEditingController();
  final verifyphone = TextEditingController();
  final verifyblood = TextEditingController();
  final verifylocation = TextEditingController();

  void dispose() {
    verifyname.dispose();
    verifyphone.dispose();
    verifyblood.dispose();
    verifylocation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency Prompt'),
        backgroundColor: Colors.red[900],
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 12, 20, 0),
        child: Column(
          children: <Widget>[
            name = TextFormField(
              controller: verifyname,
              decoration: InputDecoration(
                  labelText: 'Name:',
                  hintText: 'Enter Your Name',
                  errorText: validate(verifyname.text),
                  icon: Icon(Icons.people)),
            ),
            phone = TextFormField(
              controller: verifyphone,
              decoration: InputDecoration(
                labelText: 'Phone Number:',
                hintText: 'Enter number',
                errorText: validate(verifyphone.text),
                icon: Icon(Icons.call),
              ),
              keyboardType: TextInputType.phone,
            ),
            blood = TextFormField(
              controller: verifyblood,
              decoration: InputDecoration(
                labelText: 'Required Blood Group:',
                hintText: 'Enter Blood Type',
                errorText: validate(verifyblood.text),
                icon: Icon(Icons.local_hospital),
              ),
            ),
            location = TextFormField(
              controller: verifylocation,
              decoration: InputDecoration(
                  labelText: 'Location of Patient:',
                  hintText: 'The hospital patient is kept in',
                  errorText: validate(verifylocation.text),
                  icon: Icon(Icons.map)),
            ),
            Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
            RaisedButton(
              onPressed: () {
                (context as Element).reassemble();
              },
              child: Text('Submit', style: TextStyle(color: Colors.white)),
              color: Colors.red[900],
            ),
          ],
        ),
      ),
    );
  }

  String validate(String value) {
    if (value.isEmpty) {
      return 'Please fill in this field';
    }
    return null;
  }

  void backToMainPage(context) {
    Navigator.pop(context);
  }
}
