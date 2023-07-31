import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reapp/airq/state/mqtt_app_state.dart';
import 'package:reapp/airq/mqtt/mqtt_manager.dart';
import 'package:reapp/bnav.dart';
import 'package:reapp/nav.dart';

class MQTTViewAir extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MQTTViewState();
  }
}

class _MQTTViewState extends State<MQTTViewAir> {
  late MQTTAppState currentAppState;
  late MQTTManager manager;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final MQTTAppState appState = Provider.of<MQTTAppState>(context);
    currentAppState = appState;
    return Scaffold(
      body: _buildColumn(),
      backgroundColor: Colors.black,
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: const Text(
            "AIR QUALITY SENSOR",
            style: TextStyle(color: Color.fromARGB(255, 22, 231, 231)),
          ),
          iconTheme:
              const IconThemeData(color: Color.fromARGB(255, 4, 233, 221))),
      drawer: const NavBar(),
      bottomNavigationBar: const BtmNavBar(),
    );
  }

  Widget _buildColumn() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          _buildConnectionStateText(
              _prepareStateMessageFrom(currentAppState.getAppConnectionState)),
          _buildEditableColumn(),
          _buildScrollableTextWith(currentAppState.getHistoryText),
        ],
      ),
    );
  }

  Widget _buildEditableColumn() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _buildConnecteButtonFrom(currentAppState.getAppConnectionState),
        ],
      ),
    );
  }

  Widget _buildConnectionStateText(String status) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            color: const Color.fromARGB(255, 4, 233, 221),
            child: Text(
              status,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildScrollableTextWith(String text) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(children: [
        SizedBox(
          height: 500,
          width: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            Icon(Icons.access_time_outlined),
            const Divider(),
            const Divider(),
            Icon(Icons.thermostat_outlined),
            const Divider(),
            Icon(Icons.access_time_outlined),
            const Divider(),
            Icon(Icons.water_outlined),
            const Divider(),
            Icon(Icons.access_time_outlined),
            const Divider(),
            Icon(Icons.access_time_outlined),
            const Divider(),
            Icon(Icons.access_time_outlined),
            const Divider(),
            Icon(Icons.access_time_outlined),
            const Divider(),
          ]),
        ),
        SizedBox(
          width: 200,
          height: 500,
          child: Text(
            text,
            style: const TextStyle(color: Color.fromARGB(255, 4, 233, 221)),
          ),
        ),
      ]),
    );
  }

  Widget _buildConnecteButtonFrom(MQTTAppConnectionState state) {
    return Row(
      children: <Widget>[
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              if (state == MQTTAppConnectionState.disconnected) {
                configureAndConnect();
              } else {
                null;
              }
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 22, 231, 231)), //
            child: const Text(
              'Connect',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: ElevatedButton(
            onPressed:
                state == MQTTAppConnectionState.connected ? _disconnect : null,
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 22, 231, 231)),
            child: const Text('Disconnect',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black)),
          ),
        ),
      ],
    );
  }

  String _prepareStateMessageFrom(MQTTAppConnectionState state) {
    switch (state) {
      case MQTTAppConnectionState.connected:
        return 'Connected';
      case MQTTAppConnectionState.connecting:
        return 'Connecting';
      case MQTTAppConnectionState.disconnected:
        return 'Disconnected';
    }
  }

  void configureAndConnect() {
    manager = MQTTManager(
        host: "test.mosquitto.org",
        topic: '/TM/IAQ',
        identifier: "air_q",
        state: currentAppState);
    manager.initializeMQTTClient();
    manager.connect();
  }

  void _disconnect() {
    manager.disconnect();
  }
}
