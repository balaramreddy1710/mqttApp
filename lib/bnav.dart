import 'package:flutter/material.dart';
import 'package:reapp/airq/mqtt_view.dart';
import 'package:reapp/airq/state/mqtt_app_state.dart' as air;
import 'package:reapp/inout/mqtt_view.dart';
import 'package:reapp/inout/state/mqtt_app_state.dart' as inout;
import 'package:reapp/pc/mqtt_view.dart';
import 'package:reapp/pc/state/mqtt_app_state.dart' as pc;
import 'package:provider/provider.dart';

class BtmNavBar extends StatefulWidget {
  const BtmNavBar({super.key});

  @override
  State<BtmNavBar> createState() => _BtmNavBarState();
}

class _BtmNavBarState extends State<BtmNavBar> {
  int myIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: const Color.fromARGB(255, 4, 233, 221),
      showUnselectedLabels: true,
      backgroundColor: Colors.black12,
      iconSize: 30,
      currentIndex: myIndex,
      onTap: (int index) {
        setState(() {
          myIndex = index;
        });
        if (myIndex == 0) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ChangeNotifierProvider<air.MQTTAppState>(
                create: (_) => air.MQTTAppState(),
                child: MQTTViewAir(),
              ),
            ),
          );
        } else if (myIndex == 1) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ChangeNotifierProvider<inout.MQTTAppState>(
                create: (_) => inout.MQTTAppState(),
                child: MQTTViewInout(),
              ),
            ),
          );
        } else if (myIndex == 2) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ChangeNotifierProvider<pc.MQTTAppState>(
                create: (_) => pc.MQTTAppState(),
                child: MQTTViewPc(),
              ),
            ),
          );
        }
      },
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
    );
  }
}
