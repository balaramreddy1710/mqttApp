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
    Inout inout = Inout.fromJson(valueMap);
    //date and time
    var now = DateTime.now();
    var snow = DateFormat().format(now);

    int? inn = inout.inn;
    int? out = inout.out;
    int? balance = inout.balance;

    _receivedText =
        "\nIn_Count : $inn\n\nOut_Count : $out\n\nBalance : $balance";
    //_historyText = '\n$snow\n$_receivedText\n$_historyText\n';
    _historyText = '                               $snow\n\n   $_receivedText\n';
    notifyListeners();
    }

  void setAppConnectionState(MQTTAppConnectionState state) {
    _appConnectionState = state;
    notifyListeners();
  }

  String get getHistoryText => _historyText;
  MQTTAppConnectionState get getAppConnectionState => _appConnectionState;
}


