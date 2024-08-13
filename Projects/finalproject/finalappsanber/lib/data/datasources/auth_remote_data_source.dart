import 'package:flutter/services.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:finalappsanber/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> loginWithGoogle();
  bool isLogin();
  Future<void> logout();
  //regis
  Future<UserModel> registerWithEmail(String name, String telp, String email, String password);
  Future<UserModel> loginWithEmail(String email, String password);
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final GoogleSignIn googleSignIn;
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;

  AuthRemoteDataSourceImpl({
    required this.googleSignIn,
    required this.firebaseAuth,
    required this.firebaseFirestore,
  });

  @override
  Future<UserModel> loginWithGoogle() async {
    try {
      await googleSignIn.disconnect();
    } catch (_) {}

    final GoogleSignInAccount? googleAccount = await googleSignIn.signIn();
    if (googleAccount != null) {
      final GoogleSignInAuthentication googleAuth =
          await googleAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await firebaseAuth.signInWithCredential(credential);

      final currentUser = firebaseAuth.currentUser!;
      final userCollection =
          firebaseFirestore.collection('users').doc(currentUser.uid);
      final user = await userCollection.get();
      if (!user.exists) {
        final newUser = UserModel(
          id: currentUser.uid,
          name: currentUser.displayName,
          email: currentUser.email,
          phoneNumber: currentUser.phoneNumber,
          photoUrl: currentUser.photoURL,
          role: 'member',
          point: 0,
        );
        await userCollection.set(newUser.toDocument());
      }

      final dataUser = await userCollection.get();
      return UserModel.fromSnapshot(dataUser);
    } else {
      throw PlatformException(code: GoogleSignIn.kSignInCanceledError);
    }
  }

  @override
  bool isLogin() {
    return firebaseAuth.currentUser != null;
  }

  @override
  Future<void> logout() async {
    return await firebaseAuth.signOut();
  }

  //regis
  @override
  Future<UserModel> registerWithEmail(String name, String telp, String email, String password) async {
    final userCredential = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    print("userCredential: ${userCredential.toString()}");
    final currentUser = userCredential.user!;
    
    final newUser = UserModel(
      id: currentUser.uid,
      name: name, //currentUser.displayName ?? '',
      email: currentUser.email ?? '',
      phoneNumber: telp, //currentUser.phoneNumber ?? '',
      photoUrl: currentUser.photoURL,
      role: 'member',
      point: 0,
    );

    await firebaseFirestore.collection('users').doc(currentUser.uid).set(newUser.toDocument());

    return newUser;
  }

  @override
  Future<UserModel> loginWithEmail(String email, String password) async {
    final userCredential = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    final currentUser = userCredential.user!;
    
    final userDoc = await firebaseFirestore.collection('users').doc(currentUser.uid).get();
    return UserModel.fromSnapshot(userDoc);
  }
  
}
