import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reapp/gauge.dart';
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
        "\nTemperature : $temp\n\nPressure : $prs\n\nHumidity : $humid\n\nPm1 : $pm1\n\nPm2_5 : $pm25\n\nPm4 : $pm4\n\nPm10 : $pm10";
    //_historyText = '\n$snow\n$_receivedText\n$_historyText\n';
    _historyText = '                               $snow\n\n   $_receivedText\n';
    gauge(temp);
    notifyListeners();
  }

  void setAppConnectionState(MQTTAppConnectionState state) {
    _appConnectionState = state;
    notifyListeners();
  }

  String get getHistoryText => _historyText;
  MQTTAppConnectionState get getAppConnectionState => _appConnectionState;
}


