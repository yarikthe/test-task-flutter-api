import 'dart:async';
import 'dart:io';
import 'dart:developer' as developer;

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controller/user_controller.dart';

class CheckConnectionToInternet with ChangeNotifier {
  String status = 'Connection...';

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  final Connectivity _connectivity = Connectivity();

  late StreamSubscription? _streamSubscription;

  void checkConnectivity() async {
    var connectionResult = await _connectivity.checkConnectivity();

    if (connectionResult == ConnectivityResult.mobile || connectionResult == ConnectivityResult.wifi) {
      status = "Online";
      notifyListeners();
    } else {
      status = "Offline";
      notifyListeners();
    }

    setInternetConnectStatus();
  }

  void checkRealtimeConnection() {
    _streamSubscription = _connectivity.onConnectivityChanged.listen((event) {
      switch (event) {
        case ConnectivityResult.mobile:
        case ConnectivityResult.wifi:
          {
            status = "Online";
            notifyListeners();
          }
          break;
        default:
          {
            status = 'Offline';
            notifyListeners();
          }
          break;
      }

      setInternetConnectStatus();
    });
  }

  void setInternetConnectStatus() async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString('online_status', status);
  }

  Future<String?> getInternetConnectStatus() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString('online_status');
  }
}
