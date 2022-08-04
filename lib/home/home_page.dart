import 'package:flutter/material.dart';
import 'package:map_example/map/map_geojson.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GeopMap'),
      ),
      body: const MapGeoJson(),
    );
  }
}
