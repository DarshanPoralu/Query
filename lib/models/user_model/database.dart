import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseUserService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  updateUserData(String uid, String id, String cid) async {
    User? user = _auth.currentUser;
    List<dynamic> list = [];
    var count;
    await firebaseFirestore
        .collection("users")
        .doc(user?.uid)
        .get()
        .then((value) => list = value.data()![id]);
    await firebaseFirestore
        .collection("users")
        .doc(user?.uid)
        .get()
        .then((value) => count = value.data()![cid]);
    list.add(uid);
    count = int.parse(count);
    count++;
    await firebaseFirestore
        .collection("users")
        .doc(user?.uid)
        .update({id: list, cid: count.toString()});
  }
}
