import 'package:flutter/material.dart';
import 'package:reapp/bnav.dart';
import 'package:reapp/nav.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MQTT Sensor',
      theme: ThemeData(brightness: Brightness.dark, primaryColor: Colors.black),
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: const Text(
            "SMART BUILDING TELEMETRY",
            style: TextStyle(color: Color.fromARGB(255, 4, 233, 221)),
          ),
          iconTheme:
              IconThemeData(color: Color.fromARGB(255, 4, 233, 221), size: 30),
        ),
        drawer: const NavBar(),
        bottomNavigationBar: BtmNavBar(),
      ),
    );
  }
}

