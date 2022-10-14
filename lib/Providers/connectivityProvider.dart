import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

class ConnectivityProvider extends ChangeNotifier {

  ConnectivityResult connectionStatus = ConnectivityResult.none;
  final Connectivity connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> connectivitySubscription;

  void init(BuildContext context) {
    initConnectivity(context);
    connectivitySubscription =
        connectivity.onConnectivityChanged.listen(updateConnectionStatus);
  }


  Future<void> initConnectivity(BuildContext context) async {
    late ConnectivityResult result;
    try {
      result = await connectivity.checkConnectivity();

    } on PlatformException catch (e) {
      print('Couldn\'t check connectivity status' + e.toString());
      return;
    }
    return updateConnectionStatus(result);
  }


  Future<void> updateConnectionStatus(ConnectivityResult rs) async {
    connectionStatus = rs;
    notifyListeners();
    print("CONNECTION checking");
    Logger().d(rs);
    notifyListeners();
  }

}