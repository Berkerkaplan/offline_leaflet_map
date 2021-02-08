import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Map Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Map App',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
        ),
        body: Stack(
          children: <Widget>[
            FlutterMap(
              options: MapOptions(
                minZoom: 10.0,
                center: LatLng(40.71, -74.00), //New York un enlem boylamı
              ),
              layers: [
                TileLayerOptions(
                  urlTemplate:
                      'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: [
                    'a',
                    'b',
                    'c',
                  ], //OSM OpenCycleMap CloudMade in default halleri
                ),
                MarkerLayerOptions(
                  markers: [
                    Marker(
                      width: 45.0,
                      height: 55.0,
                      point: LatLng(
                        40.71,
                        -74.00,
                      ),
                      builder: (context) => Container(
                        child: IconButton(
                          icon: Icon(Icons.location_on),
                          onPressed: () {
                            print('Marker tapped!');
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
