// To parse this JSON data, do
//
//     final answerModel = answerModelFromJson(jsonString);

import 'dart:convert';

AnswerModel answerModelFromJson(String str) => AnswerModel.fromJson(json.decode(str));

String answerModelToJson(AnswerModel data) => json.encode(data.toJson());

class AnswerModel {
  AnswerModel({
    this.qstnId,
    this.answer,
    this.selectedAnswer,
  });

  int? qstnId;
  int? answer;
  int? selectedAnswer;

  factory AnswerModel.fromJson(Map<String, dynamic> json) => AnswerModel(
    qstnId: json["Qstn_id"],
    answer: json["answer"],
    selectedAnswer: json["selected_answer"],
  );

  Map<String, dynamic> toJson() => {
    "Qstn_id": qstnId,
    "answer": answer,
    "selected_answer": selectedAnswer,
  };
}
