import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';

class DatabaseMethods {
  getQuestions() async {
    QuerySnapshot data =
        await FirebaseFirestore.instance.collection("QuestionResponse").get();
    print("gggg");
    Logger().d(data.docs.first.data());
    return data.docs.first.data();
  }

  Future addQuestions(Map<String, Object?> data) async {
    await FirebaseFirestore.instance
        .collection("QuestionResponse")
        .doc("zg5b8IiJLUSOYg8TJqle")
        .update({
      "Question": FieldValue.arrayUnion([data])
    });
    return true;
  }

  Future<bool> deleteQuestions(Map<String, Object?> data) async {
    await FirebaseFirestore.instance
        .collection("QuestionResponse")
        .doc("zg5b8IiJLUSOYg8TJqle")
        .update({
      "Question": FieldValue.arrayRemove([data])
    });
    return true;
  }

  Future<bool> update(Map<String, Object?> newData, Map<String, Object?> oldData) async {
    await FirebaseFirestore.instance.collection('QuestionResponse').doc("zg5b8IiJLUSOYg8TJqle").update({
      "Question": FieldValue.arrayRemove([oldData])
    });
    await FirebaseFirestore.instance.collection('QuestionResponse').doc("zg5b8IiJLUSOYg8TJqle").update({
      "Question": FieldValue.arrayUnion([newData])
    });
    return true;
  }
}
