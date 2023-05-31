import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/user.dart' as model;

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> loginUser(
      {required String email, required String password}) async {
    String res = "Error";
    if (email.isNotEmpty && password.length > 6) {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      res = "Success";
    } else {
      res = "Email/passord tidak benar!";
    }
    return res;
  }

  Future<String> registrasiUser({
    required String email,
    required String password,
    required String username,
  }) async {
    String res = "Error";
    if (email.isNotEmpty && password.length > 6 && username.isNotEmpty) {
      UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      model.User user = model.User(
          uid: cred.user!.uid, email: email, username: username, dokter: false);

      _firestore.collection('users').doc(cred.user!.uid).set(user.toJson());
      res = 'Success';
    } else {
      res = 'Input kurang tepat!';
    }
    return res;
  }

  Future<String> updateUser(
      {required username, required email, required password, required oldPassword}) async {
    User user = _auth.currentUser!;
    String res = "Error";
    if (email.isNotEmpty && password.length > 6 && username.isNotEmpty) {
      _firestore
          .collection('users')
          .doc(user.uid)
          .update({'username': username, 'email': email});

      await user.updateEmail(email);
      await user.reauthenticateWithCredential(
          EmailAuthProvider.credential(email: email, password: oldPassword));
      await user.updatePassword(password);
      res = 'Success';
    } else {
      res = 'Input kurang tepat!';
    }
    return res;
  }

  // get user details
  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot documentSnapshot =
        await _firestore.collection('users').doc(currentUser.uid).get();

    return model.User.fromSnap(documentSnapshot);
  }
}
