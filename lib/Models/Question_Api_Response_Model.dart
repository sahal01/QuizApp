// To parse this JSON data, do
//
//     final questionApiResponse = questionApiResponseFromJson(jsonString);

import 'dart:convert';

QuestionApiResponse questionApiResponseFromJson(String str) => QuestionApiResponse.fromJson(json.decode(str));

String questionApiResponseToJson(QuestionApiResponse data) => json.encode(data.toJson());

class QuestionApiResponse {
  QuestionApiResponse({
    this.duration,
    this.question,
  });

  int? duration;
  List<Question>? question;

  factory QuestionApiResponse.fromJson(Map<String, dynamic> json) => QuestionApiResponse(
    duration: json["duration"],
    question: List<Question>.from(json["Question"].map((x) => Question.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "duration": duration,
    "Question": List<dynamic>.from(question!.map((x) => x.toJson())),
  };
}

class Question {
  Question({
    this.qstn,
    this.qstnId,
    this.option1,
    this.option2,
    this.option3,
    this.option4,
    this.answer,
  });

  String? qstn;
  int? qstnId;
  String? option1;
  String? option2;
  String? option3;
  String? option4;
  int? answer;

  factory Question.fromJson(Map<String, dynamic> json) => Question(
    qstn: json["Qstn"],
    qstnId: json["Qstn_id"],
    option1: json["option1"],
    option2: json["option2"],
    option3: json["option3"],
    option4: json["option4"],
    answer: int.parse(json["answer"].toString()),
  );

  Map<String, dynamic> toJson() => {
    "Qstn": qstn,
    "Qstn_id": qstnId,
    "option1": option1,
    "option2": option2,
    "option3": option3,
    "option4": option4,
    "answer": answer,
  };
}
