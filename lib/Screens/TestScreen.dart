import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/Screens/ResultScreen.dart';
import '../Providers/QuizProvider.dart';
import '../styles/Styles.dart';
import '../widget/Button.dart';
import 'connectivityWidget.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return ConnectivityWidget(
      child: Scaffold(backgroundColor: white,

        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: AppBar(
              centerTitle: true,
              automaticallyImplyLeading: true,
              backgroundColor: primary1,
              title: Text(
                'Quiz APP', style: Styles().normalS(
                  fontW: FontWeight.bold, fontS: 20, color: white),),
            ),
          ),
        ),
        body: Consumer<QuizProvider>(
            builder: (context, provider, child) {
              return
                provider.questionResponse != null ? Container(
                  child: SingleChildScrollView(
                    child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Question (${provider.currentIndex +
                                    1} / ${provider.questionResponse!
                                    .question!.length})",
                                    style: Styles().normalS(fontW: FontWeight.w500,
                                        fontS: 30,
                                        color: black)),
                                Text(
                                  '${provider.strDigits(provider.myDuration!.inHours
                                      .remainder(24))}:${provider.strDigits(provider
                                      .myDuration!.inMinutes.remainder(
                                      60))}:${provider.strDigits(provider.myDuration!
                                      .inSeconds.remainder(60))}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                      fontSize: 25),
                                )
                              ],
                            ),
                            const SizedBox(height: 100,),
                            Text("${provider.currentIndex + 1}. ${provider
                                .questionResponse!.question![provider.currentIndex]
                                .qstn} ?", style: Styles().normalS(
                                fontW: FontWeight.w400, fontS: 20, color: black)),
                            const SizedBox(height: 50),
                            Row(
                              children: [
                                Text(" ${provider.questionResponse!
                                    .question![provider.currentIndex].option1} ",
                                    style: provider.answers[provider.currentIndex]
                                        .selectedAnswer == 1 ? Styles().normalS(
                                        fontW: FontWeight.w400,
                                        fontS: 20,
                                        color: primary1) : Styles().normalS(
                                        fontW: FontWeight.w400,
                                        fontS: 20,
                                        color: black)),


                                IconButton(
                                  color: Colors.lightGreen,
                                  //textColor: Colors.white,
                                  onPressed: () {
                                    provider.onChange(1);
                                  },
                                  icon: provider.answers[provider.currentIndex]
                                      .selectedAnswer == 1 ? const Icon(Icons
                                      .radio_button_checked) : const Icon(Icons
                                      .radio_button_off),
                                  //child: Text(answerText),
                                ),


                              ],
                            ),
                            const SizedBox(height: 20,),
                            Row(
                              children: [
                                Text(" ${provider.questionResponse!
                                    .question![provider.currentIndex].option2} ",
                                    style: provider.answers[provider.currentIndex]
                                        .selectedAnswer == 2 ? Styles().normalS(
                                        fontW: FontWeight.w400,
                                        fontS: 20,
                                        color: primary1) : Styles().normalS(
                                        fontW: FontWeight.w400,
                                        fontS: 20,
                                        color: black)),


                                IconButton(
                                  color: Colors.lightGreen,
                                  //textColor: Colors.white,
                                  onPressed: () {
                                    provider.onChange(2);
                                  },
                                  icon: provider.answers[provider.currentIndex]
                                      .selectedAnswer == 2 ? const Icon(Icons
                                      .radio_button_checked) : const Icon(Icons
                                      .radio_button_off),
                                  //child: Text(answerText),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20,),
                            Row(
                              children: [
                                Text(" ${provider.questionResponse!
                                    .question![provider.currentIndex].option3} ",
                                    style: provider.answers[provider.currentIndex]
                                        .selectedAnswer == 3 ? Styles().normalS(
                                        fontW: FontWeight.w400,
                                        fontS: 20,
                                        color: primary1) : Styles().normalS(
                                        fontW: FontWeight.w400,
                                        fontS: 20,
                                        color: black)),

                                IconButton(
                                  color: Colors.lightGreen,
                                  //textColor: Colors.white,
                                  onPressed: () {
                                    provider.onChange(3);
                                  },
                                  icon: provider.answers[provider.currentIndex]
                                      .selectedAnswer == 3 ? const Icon(Icons
                                      .radio_button_checked) : const Icon(Icons
                                      .radio_button_off),
                                  //child: Text(answerText),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20,),
                            Row(
                              children: [
                                Text(" ${provider.questionResponse!
                                    .question![provider.currentIndex].option4} ",
                                    style: provider.answers[provider.currentIndex]
                                        .selectedAnswer == 4 ? Styles().normalS(
                                        fontW: FontWeight.w400,
                                        fontS: 20,
                                        color: primary1) : Styles().normalS(
                                        fontW: FontWeight.w400,
                                        fontS: 20,
                                        color: black)),

                                IconButton(
                                  color: Colors.lightGreen,
                                  //textColor: Colors.white,
                                  onPressed: () {
                                    provider.onChange(4);
                                  },
                                  icon: provider.answers[provider.currentIndex]
                                      .selectedAnswer == 4 ? const Icon(Icons
                                      .radio_button_checked) : const Icon(Icons
                                      .radio_button_off),
                                  //child: Text(answerText),
                                ),
                              ],
                            ),
                            const SizedBox(height: 100,),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                provider.currentIndex >= 1 ? Button().button(
                                    action: () {
                                      provider.previousQuestion();
                                    },
                                    txt: "Previous",
                                    context: context,
                                    color: Colors.grey) : Container(),
                                provider.currentIndex + 1 !=
                                    provider.questionResponse!.question!.length
                                    ? Button().button(
                                    action: () {
                                      provider.answers[provider.currentIndex]
                                          .selectedAnswer != 0 ? provider
                                          .nextQuestion() : ScaffoldMessenger.of(
                                          context)
                                          .showSnackBar(provider.snackBar);
                                    },
                                    txt: "Next", context: context, color: primary1)
                                    :provider.answers[provider.currentIndex]
                                    .selectedAnswer == 0? Opacity(opacity: .2,
                                child: Button().button(
                                    action: () {

                                    },
                                    txt: "Submit", context: context, color: Colors.green),):
                                Opacity(opacity: 1,
                                  child: Button().button(
                                      action: () {
                                        provider.stopTimer();
                                        provider.checkAnswer(context: context);
                                        provider.resultScoreStatus();

                                      },
                                      txt: "Submit", context: context, color: Colors.green),

                                )],
                            )

                          ],
                        )
                    )
                  ),
                ) : const Center(child: CircularProgressIndicator(),);
            }),
      ),
    );
  }
}
