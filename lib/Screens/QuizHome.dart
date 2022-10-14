import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/Screens/TestScreen.dart';
import '../Providers/QuizProvider.dart';
import '../styles/Styles.dart';
import '../widget/Button.dart';
import 'connectivityWidget.dart';

class QuizHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConnectivityWidget(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          automaticallyImplyLeading: true,
          backgroundColor: white,
          leading: const BackButton(
            color: Colors.black,
          ),
          title: Text(
            'Quiz Home',
            style: Styles()
                .normalS(fontW: FontWeight.normal, fontS: 22, color: black),
          ),
        ),
        body: Consumer<QuizProvider>(builder: (context, provider, child) {
          return provider.questionResponse != null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "QA",
                        style: Styles().normalS(
                            fontW: FontWeight.w500, fontS: 50, color: black),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      Text(
                        "Total No. of Questions : ${provider.questionResponse!.question!.length}",
                        style: Styles().normalS(
                            fontW: FontWeight.w500, fontS: 18, color: Colors.black38),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                          "Duration : ${provider.questionResponse!.duration} Seconds",
                          style: Styles().normalS(
                              fontW: FontWeight.w500, fontS: 18, color: Colors.black38)),
                      const SizedBox(
                        height: 100,
                      ),
                      // Container(height: 200,width: 200,child: Image.network(
                      //   "https://firebasestorage.googleapis.com/v0/b/quizapp-1d296.appspot."
                      //       "com/o/Screenshot%20(1).png?alt=media&token=f6b8b48d-3941-4a38-a695-39b81afd724a",fit: BoxFit.cover,)),
                      Button().button(
                          action: () {
                            provider.resetQuiz();
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const TestScreen()));
                            Provider.of<QuizProvider>(context, listen: false)
                                .startTimer(context);
                          },
                          txt: "Start Quiz",
                          context: context,
                          color: primary1)
                    ],
                  ),
                )
              : const Center(child: CircularProgressIndicator());
        }),
      ),
    );
  }
}
