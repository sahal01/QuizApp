import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/styles/Styles.dart';

import '../Providers/connectivityProvider.dart';

class ConnectivityWidget extends StatelessWidget {
  ConnectivityWidget({Key? key, required this.child}) : super(key: key);

  Widget child;

  @override
  Widget build(BuildContext context) {
    var connectionStatus = Provider.of<ConnectivityProvider>(context);
    return connectionStatus.connectionStatus == ConnectivityResult.none
        ? const OfflineScreen()
        : child;
  }
}

class OfflineScreen extends StatelessWidget {
  const OfflineScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Text("OFFLINE !!!",style: Styles().normalS(fontW: FontWeight.w500, fontS: 20, color: Colors.black26),),
      ),
    );
  }
}
