import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:covid/nav-drawer.dart';
import 'dart:convert';

void main() => runApp(MaterialApp(
      title: "Covid Nepal",
      debugShowCheckedModeBanner: false,
      home: CovidHome(),
    ));

Future<http.Response> fetchPompt() {
  return http.get('http://192.168.1.66:8000/api/bloods/1');
}

class Prompt {
  final String name;
  final int phone;
  final String blood_group;
  final String location;

  Prompt({this.name, this.phone, this.blood_group, this.location});

  factory Prompt.fromJson(Map<String, dynamic> json) {
    return Prompt(
        name: json['name'],
        phone: json['phone'],
        blood_group: json['blood_group'],
        location: json['location']);
  }
}

Future<Prompt> fetchPrompt() async {
  final response_blood =
      await http.get('http://192.168.1.66:8000/api/bloods/1');

  if (response_blood.statusCode == 200) {
    return Prompt.fromJson(json.decode(response_blood.body));
  } else {
    throw Exception('Failed to load data');
  }
}

class CovidHome extends StatefulWidget {
  @override
  _CovidHomeState createState() => _CovidHomeState();
}

class _CovidHomeState extends State<CovidHome> {
  // for buffer
  bool loading = true;
  List countrystatus;

  //Importing blood requests
  Future<Prompt> futurePrompt;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    futurePrompt = fetchPrompt();
  }

  // Importing covid data
  Future<String> _getCovidData() async {
    var response = await http.get('https://www.brp.com.np/covid/nepal.php');
    var getData = json.decode(response.body);
    if (this.mounted) {
      setState(() {
        loading = false;
        countrystatus = [getData];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                _getCovidData();
              }),
        ],
        title: Text('Covid Nepal'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            loading
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: countrystatus == null ? 0 : countrystatus.length,
                    itemBuilder: (context, i) {
                      return listItem(i);
                    }),
            Center(
              child: Text(
                'Tap the refresh icon to get the latest updates',
                style: TextStyle(
                  color: Colors.red[900],
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(30),
              child: Text(
                'Urgent Help',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.red[900],
                    fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: <Widget>[
                FutureBuilder<Prompt>(
                  future: futurePrompt,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return _showhelpbox();
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    // By default, show a loading spinner.
                    return CircularProgressIndicator();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget listItem(int i) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Text(
                      countrystatus[0]["latest_stat_by_country"][i]
                          ["new_cases"],
                      style: TextStyle(fontSize: 20),
                    ),
                    Text('New Cases',
                        style: TextStyle(
                            color: Colors.red[900],
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 5))
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Text(
                      countrystatus[0]["latest_stat_by_country"][i]
                          ["total_cases"],
                      style: TextStyle(fontSize: 18),
                    ),
                    Text('Total Cases',
                        style: TextStyle(
                            color: Colors.red[900],
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 5))
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Text(
                      countrystatus[0]["latest_stat_by_country"][i]
                          ["total_recovered"],
                      style: TextStyle(fontSize: 18),
                    ),
                    Text('Recovered',
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 5))
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _showhelpbox() {
    return Column(
      children: <Widget>[Text('...')],
    );
  }
}
