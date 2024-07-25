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
      final UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      final User? firebaseUser = userCredential.user;
      if (firebaseUser != null) {
        final DocumentSnapshot userDoc = await _firestore
            .collection('dataUsers')
            .doc(firebaseUser.uid)
            .get();
        return UserModel(
          id: firebaseUser.uid,
          email: firebaseUser.email,
          displayName: userDoc['username'],
          fullName: userDoc['fullName'],
          address: userDoc['address'],
          aboutMe: userDoc['aboutMe'],
        );
      }
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }
    return null;
  }

  /// Create user
  Future<UserModel?> signUpUser(String email, String password, String fullName,
      String username, String address, String aboutMe) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      final User? firebaseUser = userCredential.user;
      if (firebaseUser != null) {
        await _firestore.collection('dataUsers').doc(firebaseUser.uid).set({
          'email': email,
          'fullName': fullName,
          'username': username,
          'address': address,
          'aboutMe': aboutMe,
        });
        return UserModel(
          id: firebaseUser.uid,
          email: firebaseUser.email,
          displayName: username,
          fullName: fullName,
          address: address,
          aboutMe: aboutMe,
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
