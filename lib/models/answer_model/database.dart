import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import 'answer_model.dart';

class DatabaseAnswerService {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<String> insertAnswerData(String answer, String qid, String answered) async {
    String aid = Uuid().v4();
    AnswerModel questionModel = AnswerModel(
        answer: answer, aid: aid, countSub: '0', mainA: true, qid: qid, subQid: [], answered: answered);
    await firebaseFirestore
        .collection("answers")
        .doc(aid)
        .set(questionModel.toMap());
    return aid;
  }

  insertSubAnswerData(String answer, String qid, String answered) async {
    String aid = Uuid().v4();
    AnswerModel questionModel =
        AnswerModel(answer: answer, aid: aid, mainA: false, qid: qid);
    await firebaseFirestore
        .collection("answers")
        .doc(aid)
        .set(questionModel.toMap());
  }

  updateAnswerData(String aid, String subQid, String answered) async {
    List<dynamic> list = [];
    var count;
    await firebaseFirestore
        .collection("answers")
        .doc(aid)
        .get()
        .then((value) => list = value.data()!['subQid']);
    await firebaseFirestore
        .collection("answers")
        .doc(aid)
        .get()
        .then((value) => count = value.data()!['countSub']);
    list.add(subQid);
    count = int.parse(count);
    count++;
    await firebaseFirestore
        .collection("answers")
        .doc(aid)
        .update({'subQid': list, 'countSub': count.toString(), 'answered': answered});
  }
}
