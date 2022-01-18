import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class CircleImage extends StatefulWidget {

  @override
  State<CircleImage> createState() => _CircleImageState();
}

class _CircleImageState extends State<CircleImage> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;
  String? url;

   getUrl() async{
     String fileName = _auth.currentUser!.uid;
     url = await storage.ref('test/$fileName').getDownloadURL();
  }

  @override
  Widget build(BuildContext context) {
    getUrl();
    print("Darshan$url");
    return url != null ? CircleAvatar(
      backgroundImage: NetworkImage(url!),
    ) : CircleAvatar(
      backgroundImage: AssetImage("assets/images/profile.jpg"),
    );
  }
}
