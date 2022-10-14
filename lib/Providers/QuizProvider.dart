import 'dart:async';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:quizapp/Database/Database.dart';
import 'package:quizapp/Models/Answer_Model.dart';
import 'package:quizapp/Screens/ResultScreen.dart';
import 'package:quizapp/widget/alert.dart';

import '../Models/Question_Api_Response_Model.dart';

class QuizProvider extends ChangeNotifier {
  QuestionApiResponse? questionResponse;
  List<AnswerModel> answers = [];
  int currentIndex = 0;
  Timer? countdownTimer;
  Duration? myDuration;
  double score = 0;
  int result = 0;
  TextEditingController qstn = TextEditingController();
  TextEditingController option1 = TextEditingController();
  TextEditingController option2 = TextEditingController();
  TextEditingController option3 = TextEditingController();
  TextEditingController option4 = TextEditingController();
  TextEditingController answer = TextEditingController();

  reset() {
    qstn.text = "";
    option1.text = "";
    option2.text = "";
    option3.text = "";
    option4.text = "";
    answer.text = "";
    notifyListeners();
  }

  getQuestion() async {
    questionResponse = null;
    notifyListeners();
    var data = await DatabaseMethods().getQuestions();
    print("dataaaaaaaaaaaaaaa");
    Logger().d(data);
    questionResponse = QuestionApiResponse.fromJson(data);
    print("rrrrr");
    answers = [];
    print("BEFORE SORT");
    Logger().d(questionResponse!.toJson());
    // code for sorting
    questionResponse!.question!.sort((a, b) => a.qstnId!.compareTo(b.qstnId!));
    print("AFTER SORT");
    Logger().d(questionResponse!.toJson());
    questionResponse!.question!.forEach((element) {
      answers.add(AnswerModel.fromJson({
        "Qstn_id": element.qstnId,
        "answer": element.answer,
        "selected_answer": 0
      }));
    });
    notifyListeners();
  }

  previousQuestion() {
    currentIndex = currentIndex - 1;
    notifyListeners();
  }

  nextQuestion() {
    currentIndex = currentIndex + 1;
    notifyListeners();
  }

  onChange(int val) {
    answers[currentIndex].selectedAnswer = val;
    notifyListeners();
  }

  checkAnswer({required BuildContext context}) {
    // ShowAlerts().showAlertCircular(context);
    answers.forEach((element) {
      if (element.answer == element.selectedAnswer) {
        score = score + 1;
      }
    });
    notifyListeners();
    print("SCORE IS ");
    print(score);
    Navigator.pop(context);
    Navigator.pop(context);
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => const ResultScreen()));
  }

  resetQuiz() {
    result=0;
    score = 0;
    currentIndex = 0;
    answers.forEach((element) {
      element.selectedAnswer = 0;
      notifyListeners();
    });
  }

  String strDigits(int n) => n.toString().padLeft(2, '0');

  void startTimer(BuildContext context) {
    myDuration = Duration(seconds: questionResponse!.duration!);
    countdownTimer = Timer.periodic(
        const Duration(seconds: 1), (_) => setCountDown(context));
    notifyListeners();
  }



  resultScoreStatus(){
    if(score==(questionResponse!.question!.length)){
      result=1;
      notifyListeners();
    }
    else if(score>(questionResponse!.question!.length)/1.5){
      result=2;
      notifyListeners();
    }
    else if(score>(questionResponse!.question!.length)/3)
      {
        result=3;
        notifyListeners();
      }
    else{
      result=0;
      notifyListeners();
    }
  }
  void stopTimer() {
    if (countdownTimer != null) {
      countdownTimer!.cancel();
      notifyListeners();
    } else {
      countdownTimer = null;
    }
  }

  void setCountDown(BuildContext context) {
    const reduceSecondsBy = 1;
    final seconds = myDuration!.inSeconds - reduceSecondsBy;
    if (seconds < 0) {
      if (countdownTimer == null) {
        // countdownTimer!.cancel();
        myDuration = Duration(seconds: seconds);
        notifyListeners();
      } else {
        stopTimer();
        checkAnswer(context: context);
      }
    } else {
      myDuration = Duration(seconds: seconds);
      notifyListeners();
    }
    notifyListeners();
  }

  var snackBar = const SnackBar(content: Text('Please Select Any Option'));

  void setEditData({required Question data}) {
    qstn.text = data.qstn!;
    answer.text = data.answer.toString();
    option1.text = data.option1.toString();
    option2.text = data.option2.toString();
    option3.text = data.option3.toString();
    option4.text = data.option4.toString();
  }

  void addQuestion(BuildContext context) async {
    ShowAlerts().showAlertCircular(context);
    Map<String, Object?> data = {
      "Qstn": qstn.text,
      "Qstn_id": questionResponse!.question!.length + 1,
      "option1": option1.text,
      "option2": option2.text,
      "option3": option3.text,
      "option4": option4.text,
      "answer": int.parse(answer.text),
    };
    print("SENDING DATA :");
    Logger().d(data);
    // DatabaseMethods().addQuestions(data);
    bool res = await DatabaseMethods().addQuestions(data);
    Navigator.pop(context);
    if (res) {
      reset();
      getQuestion();
    }
  }

  void editQuestion(BuildContext context, Question editdata, ) async {
    ShowAlerts().showAlertCircular(context);
    Map<String, Object?> data = {
      "Qstn": qstn.text,
      "Qstn_id": editdata.qstnId,
      "option1": option1.text,
      "option2": option2.text,
      "option3": option3.text,
      "option4": option4.text,
      "answer": int.parse(answer.text),
    };
    print("Edit DATA :");
    Logger().d(data);

    bool res = await DatabaseMethods().update(data, editdata.toJson());
    Navigator.pop(context);
    Navigator.pop(context);
    if (res) {
      getQuestion();
    }
  }

  void deleteQuestion(BuildContext context, Question data) async {
    ShowAlerts().showAlertCircular(context);
    print("SENDING DATA :");
    Logger().d(data.toJson());
    bool res = await DatabaseMethods().deleteQuestions(data.toJson());
    Navigator.pop(context);
    if (res) {
      getQuestion();
    }
  }
}
