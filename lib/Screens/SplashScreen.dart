import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/Database/Database.dart';
import 'package:quizapp/Screens/QuizHome.dart';
import 'package:quizapp/styles/Styles.dart';

import '../Providers/QuizProvider.dart';
import '../Providers/connectivityProvider.dart';
import 'Home.dart';



class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(
        const Duration(seconds: 3),
            () {

          Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                  builder: (BuildContext context) => Home()));
          Provider.of<ConnectivityProvider>(context,listen: false).init(context);

        });
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return  Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/image/qstn.png",width: w/2,height: 200,),
              SizedBox(height: 20,),
              const Text("QUIZ APP",style: TextStyle(color: Colors.blueGrey,fontSize: 25,fontWeight: FontWeight.bold)),
            ],
          ),
        ));
  }
}
