import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/Screens/AdminScreen/AdminHome.dart';
import 'package:quizapp/Screens/QuizHome.dart';
import 'package:quizapp/Screens/connectivityWidget.dart';

import '../Providers/QuizProvider.dart';
import '../styles/Styles.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return ConnectivityWidget(
      child: Scaffold(
        backgroundColor: white,
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
            InkWell(onTap: (){
              Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (BuildContext context) => AdminHome()));
              Provider.of<QuizProvider>(context, listen: false).getQuestion();

            },
              child: Card(
              color: Colors.blueGrey,
              shape: const RoundedRectangleBorder(
                borderRadius:
                BorderRadius.all(Radius.circular(7.0)),
              ),
              child: SizedBox(
                width: w/2,height: 50,
           child:   Center(child: Row(mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 const Icon(Icons.admin_panel_settings,color: Colors.white,),
                 const SizedBox(width: 5,),
                 Text("Admin",style: Styles().normalS(fontW: FontWeight.w500, fontS: 18, color: white),),
               ],
           )),
              )),
            ),
              const SizedBox(height: 30,),
              InkWell(onTap: (){
                Provider.of<QuizProvider>(context, listen: false).getQuestion();

                Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (BuildContext context) => QuizHome()));
              },
                child: Card(
                    color: Colors.blueGrey,
                    shape: const RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.all(Radius.circular(7.0)),
                    ),
                    child: SizedBox(
                      width: w/2,height: 50,
                      child:   Center(child: Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.person,color: Colors.white,),
                          const SizedBox(width: 5,),
                          Text("User",style: Styles().normalS(fontW: FontWeight.w500, fontS: 18, color: white),),
                        ],
                      )),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
