import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:socialtutorial/models/user.dart';

class FireStoreDatabase {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  /// Get a stream of a single document
  Stream<SocialUser> streamUser(String id) {
    return firestore
        .collection('users')
        .doc(id)
        .get()
        .asStream()
        .map((snap) => SocialUser.fromMap(snap.data(), id));
  }

  getUsers() async {
    await firestore.collection('users').get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        print(result.data());
      });
    });
  }

  void createUser() {
    firestore.collection("users").add({
      "name": "john",
      "age": 50,
      "email": "example@example.com",
      "address": {"street": "street 24", "city": "new york"}
    }).then((value) {
      print(value.id);
    });
  }

  void updateUser() {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    firestore
        .collection("users")
        .doc(firebaseUser.uid)
        .update({"age": 60}).then((_) {
      print("success!");
    });
  }

  void searchWhere(
      {String collection,
      String fieldName,
      dynamic condition,
      String conditionValue}) async {
    var result = await firestore
        .collection("countries")
        .where(fieldName, isEqualTo: conditionValue)
        .get();
    result.docs.forEach((res) {
      print(res.data());
    });
  }
}
