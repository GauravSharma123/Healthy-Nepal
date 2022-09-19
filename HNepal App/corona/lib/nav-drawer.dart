import 'package:covid/EmergencyHelp.dart';
import 'package:covid/hospitals.dart';
import 'package:covid/Policy.dart';
import 'package:flutter/material.dart';
import 'package:covid/contribute.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(''),
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill, image: AssetImage('images/icon.jpg')),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home Page'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.healing),
            title: Text('Emergency Help'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EmergencyHelp()),
              )
            },
          ),
          ListTile(
            leading: Icon(Icons.live_help),
            title: Text('Contribute'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Contribute()),
              )
            },
          ),
          ListTile(
            leading: Icon(Icons.local_hospital),
            title: Text('Hospitals/Services'),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Hospitals())),
            },
          ),
          ListTile(
            leading: Icon(Icons.warning),
            title: Text('Policy and Fair Use'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Policy()),
              )
            },
          ),
        ],
      ),
    );
  }
}
