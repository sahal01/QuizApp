import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/Screens/QuizHome.dart';

import '../Providers/QuizProvider.dart';
import '../styles/Styles.dart';
import '../widget/Button.dart';
import 'connectivityWidget.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return
      ConnectivityWidget(
              child: Scaffold(
                body: Consumer<QuizProvider>(
                  builder: (context,provider,child){
                    return Center(
                      child: Column(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          provider.result==1?Image.asset("assets/image/welldone.png",width: w/2,height: 200,):Container(),
                          provider.result==2?Image.asset("assets/image/good.png",width: w/2,height: 200,):Container(),
                          provider.result==3?Image.asset("assets/image/notbad.png",width: w/2,height: 200,):Container(),
                          provider.result==0?Image.asset("assets/image/bad.png",width: w/2,height: 200,):Container(),
                          const SizedBox(height: 30,),

                          Text("YOUR SCORE IS : ${provider.score.toStringAsFixed(2)}", style: Styles().normalS(
                              fontW: FontWeight.bold,
                              fontS: 22,
                              color: Colors.black)),
                          const SizedBox(height: 50,),

                          Button().button(
                              action: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (BuildContext context) => QuizHome()));
                              },
                              txt: "Retry", context: context, color: primary1)
                        ],
                      ),

                    );
                  },
                ),
              ),
            );
  }
}
