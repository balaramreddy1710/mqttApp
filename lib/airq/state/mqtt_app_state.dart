import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reapp/obj.dart';

enum MQTTAppConnectionState { connected, disconnected, connecting }

class MQTTAppState with ChangeNotifier {
  MQTTAppConnectionState _appConnectionState =
      MQTTAppConnectionState.disconnected;
  String _receivedText = '';
  String _historyText = '';

  void setReceivedText(String text) {
    //decoding json string
    Map<String, dynamic> valueMap = json.decode(text);
    Air user = Air.fromJson(valueMap);
    //date and time
    var now = DateTime.now();
    var snow = DateFormat().format(now);

    double temp = user.temp;
    double prs = user.pressure;
    double humid = user.rltHumid;
    double pm1 = user.pm1;
    double pm25 = user.pm2_5;
    double pm4 = user.pm4;
    double pm10 = user.pm10;
    _receivedText =
        "\n\nTemperature : $temp\n\n\nPressure : $prs\n\n\nHumidity : $humid\n\n\nPm1 : $pm1\n\n\nPm2_5 : $pm25\n\n\nPm4 : $pm4\n\n\nPm10 : $pm10";
     
    _historyText = '$snow\n\n   $_receivedText\n';
    notifyListeners();
  }

  void setAppConnectionState(MQTTAppConnectionState state) {
    _appConnectionState = state;
    notifyListeners();
  }

  String get getHistoryText => _historyText;
  MQTTAppConnectionState get getAppConnectionState => _appConnectionState;
}
