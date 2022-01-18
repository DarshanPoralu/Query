class UserModel {
  final String? uid;
  final String? username;
  final String? email;
  final String? designation;
  final String? department;
  final String? joined;
  final List<String>? qid;
  final String? countQid;
  final List<String>? aid;
  final String? countAid;
  final List<String>? sentQid;
  final String? countSentQid;
  final List<String>? recQid;
  final String? countRecQid;

  UserModel({
    this.email,
    this.username,
    this.designation,
    this.department,
    this.uid,
    this.joined,
    this.qid,
    this.countQid,
    this.aid,
    this.countAid,
    this.recQid,
    this.countRecQid,
    this.sentQid,
    this.countSentQid,
  });

// data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      email: map['email'],
      username: map['username'],
      designation: map['designation'],
      department: map['department'],
      uid: map['uid'],
      joined: map['joined'],
      countQid: map['countQid'],
      qid: map['qid'].cast<String>(),
      countAid: map['countAid'],
      aid: map['aid'].cast<String>(),
      countRecQid: map['countRecQid'],
      recQid: map['recQid'].cast<String>(),
      countSentQid: map['countSentQid'],
      sentQid: map['sentQid'].cast<String>(),
    );
  }

// sending data to server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'username': username,
      'email': email,
      'designation': designation,
      'department': department,
      'joined': joined,
      'qid': qid,
      'countQid': countQid,
      'aid': aid,
      'countAid': countAid,
      'recQid': recQid,
      'countRecQid': countRecQid,
      'sentQid': sentQid,
      'countSentQid': countSentQid,
    };
  }
}
