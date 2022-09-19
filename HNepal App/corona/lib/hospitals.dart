import 'package:flutter/material.dart';
import 'package:nominatim_location_picker/nominatim_location_picker.dart';
import 'package:flutter_map/flutter_map.dart';

class Hospitals extends StatefulWidget {
  MapLoader createState() => MapLoader();
}

class MapLoader extends State<Hospitals> {
  Map _pickedLocation;

  Future getLocationWithNominatim() async {
    Map result = await showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return NominatimLocationPicker(
            searchHint: 'Search...',
            awaitingForLocation: "Searching for your location",
            customMapLayer: TileLayerOptions(
                urlTemplate:
                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c']),
          );
        });
    if (result != null) {
      setState(() => _pickedLocation = result);
    } else {
      return;
    }
  }

  RaisedButton nominatimButton(Color color, String name) {
    return RaisedButton(
      color: color,
      onPressed: () async {
        await getLocationWithNominatim();
      },
      textColor: Colors.white,
      child: Center(
        child: Text(name),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    );
  }

  Widget getLocationWithMapBox() {
    return MapBoxLocationPicker(
      popOnSelect: true,
      country: 'np',
      apiKey:
          "pk.eyJ1IjoiZ2F1cmF2MDU4IiwiYSI6ImNrZXNrNGNoMTNjMmEydHBjb3dhcWFvOHEifQ.WSRE9N3D3vOyFwtbSgat2A",
      limit: 10,
      searchHint: 'Search...',
      awaitingForLocation: "Searching for your location",
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hospitals/Services'),
        backgroundColor: Colors.red[900],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
            child: _pickedLocation != null
                ? Center(child: Text("$_pickedLocation"))
                : nominatimButton(
                    Colors.red[900], 'Search for Hospitals/Services'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset("images/hospital.jpg"),
              Text('  '),
              Image.asset("images/clinic.jpg"),
              Text('  '),
              Image.asset("images/pharmacy.jpg"),
              Text('  '),
            ],
          ),
          Text(' '),
          Text(
            'Zoom into the map to view hospitals, clinics and pharmacies near you. The markers are shown abhove.',
            style: TextStyle(
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  void backToMainPage(context) {
    Navigator.pop(context);
  }
}
