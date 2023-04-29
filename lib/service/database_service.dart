import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;
  DatabaseService(this.uid);

  //reference for collection
  final CollectionReference userCollection = FirebaseFirestore.instance.collection("users");
  final CollectionReference groupCollection = FirebaseFirestore.instance.collection("groups");

  // updating usser data

  Future updateUserData(String fullName, String email) async {
    return await userCollection.doc(uid).set({
      "fullName" : fullName,
      "email" : email,
      "gorups" : [],
      "profilePic" : "",
      "uid" : uid
    });
  }
}
