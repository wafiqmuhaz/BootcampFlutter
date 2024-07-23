import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
// ... (other methods)

  ///signIn
  Future<UserModel?> signInUser(String email, String password) async {
    try {
      final UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      final User? firebaseUser = userCredential.user;
      if (firebaseUser != null) {
        return UserModel(
          id: firebaseUser.uid,
          email: firebaseUser.email,
          displayName: firebaseUser.displayName,
        );
      }
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }
    return null;
  }

  /// Create user
  Future<UserModel?> signUpUser(String email, String password) async {
    try {
      final UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      final User? firebaseUser = userCredential.user;
      if (firebaseUser != null) {
        await _firestore.collection('dataUsers').doc(firebaseUser.uid).set({
          'email': email,
        });
        return UserModel(
          id: firebaseUser.uid,
          email: firebaseUser.email,
          displayName: firebaseUser.displayName,
        );
      }
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }
    return null;
  }


  /// Sign out user
  Future<void> signOutUser() async {
    final User? firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      await FirebaseAuth.instance.signOut();
    }
  }
  // ... (other methods)}
}
