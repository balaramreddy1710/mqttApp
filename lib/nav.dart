import 'dart:io';
import 'package:flutter/material.dart';
import 'package:reapp/airq/mqtt_view.dart';
import 'package:reapp/inout/mqtt_view.dart';
import 'package:reapp/airq/state/mqtt_app_state.dart' as air;
import 'package:reapp/inout/state/mqtt_app_state.dart' as inout;
import 'package:reapp/pc/state/mqtt_app_state.dart' as pc;
import 'package:provider/provider.dart';
import 'package:reapp/pc/mqtt_view.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: ListView(
        children: [
          const Divider(),
          ListTile(
            leading: const Icon(Icons.air_outlined,color: Color.fromARGB(255, 22, 231, 231),),
            title: const Text('Air Quality',
                style: TextStyle(color: Color.fromARGB(255, 22, 231, 231))),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      ChangeNotifierProvider<air.MQTTAppState>(
                    create: (_) => air.MQTTAppState(),
                    child: MQTTViewAir(),
                  ),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.input_outlined,color: Color.fromARGB(255, 22, 231, 231),),
            title: const Text('In & Out ',
                style: TextStyle(color: Color.fromARGB(255, 22, 231, 231))),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      ChangeNotifierProvider<inout.MQTTAppState>(
                    create: (_) => inout.MQTTAppState(),
                    child: MQTTViewInout(),
                  ),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.people_outline,color: Color.fromARGB(255, 22, 231, 231),),
            title: const Text('People Count',
                style: TextStyle(color: Color.fromARGB(255, 22, 231, 231))),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ChangeNotifierProvider<pc.MQTTAppState>(
                    create: (_) => pc.MQTTAppState(),
                    child: MQTTViewPc(),
                  ),
                ),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings,color: Color.fromARGB(255, 22, 231, 231),),
            title: const Text('Settings',
                style: TextStyle(color: Color.fromARGB(255, 22, 231, 231))),
            onTap: () {
              //     Navigator.of(context).push(
              //       MaterialPageRoute(
              //         builder: (context) => const Settings(),
              //       ),
              //   );
            },
          ),
          ListTile(
              title: const Text('Exit',
                  style: TextStyle(color: Color.fromARGB(255, 22, 231, 231))),
              leading: const Icon(Icons.exit_to_app,color: Color.fromARGB(255, 22, 231, 231),),
              onTap: () => exit(0)),
        ],
      ),
    );
  }
}
