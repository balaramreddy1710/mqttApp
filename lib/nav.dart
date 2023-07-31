import 'dart:io';
import 'package:flutter/material.dart';
// import 'package:reapp/airq/state/mqtt_app_state.dart' as air;
// import 'package:reapp/inout/state/mqtt_app_state.dart' as inout;
// import 'package:reapp/pc/state/mqtt_app_state.dart' as pc;
// import 'package:provider/provider.dart';


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
