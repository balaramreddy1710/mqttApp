import 'package:flutter/material.dart';
import 'nav.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int myIndex = 0;
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
            iconTheme: IconThemeData(color: Color.fromARGB(255, 4, 233, 221),size: 30),),
        drawer: const NavBar(),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color.fromARGB(255, 4, 233, 221),
          selectedFontSize: 15,
          showUnselectedLabels: false,
          showSelectedLabels: true,
          backgroundColor: Colors.black12,
          iconSize: 30,
          onTap: (index) {
            setState(() {
              myIndex = index;
            });
          },
          currentIndex: myIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.air_outlined,
                color: Color.fromARGB(255, 22, 231, 231),
              ),
              label: 'AIR QUALITY',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.input_outlined,
                color: Color.fromARGB(255, 22, 231, 231),
              ),
              label: 'IN & OUT',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.people_outline,
                color: Color.fromARGB(255, 22, 231, 231),
              ),
              label: 'PEOPLE COUNT',
            ),
          ],
        ),
      ),
    );
  }
}
