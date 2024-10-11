// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:taaza_khabar/common/custom_snackbar.dart';
import 'package:taaza_khabar/features/auth/signup_page.dart';
import 'package:taaza_khabar/features/home/home_page.dart';

class UserAuthProvider extends ChangeNotifier {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  UserAuthProvider(
      {required FirebaseAuth auth, required FirebaseFirestore firestore})
      : _auth = auth,
        _firestore = firestore;

  Future<void> createNewUserWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'name': name,
        'email': email,
        'password': password,
      });
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
          (route) => false);
      CustomSnackbar.showSnackbar(context, 'User created Successfully');
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      CustomSnackbar.showSnackbar(
        context,
        e.message!,
        backgroundColor: Colors.red,
      );
    }
  }

  Future<void> signInWithUsernameAndPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      debugPrint(userCredential.toString());
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
          (route) => false);
      CustomSnackbar.showSnackbar(context, 'User logged in successfully!');
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      CustomSnackbar.showSnackbar(
        context,
        e.message!,
        backgroundColor: Colors.red,
      );
    }
  }

  Future<void> logout({required BuildContext context}) async {
    try {
      await _auth.signOut();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) =>
              const SignupPage(), // Assuming you have a login page
        ),
        (route) => false,
      );
      CustomSnackbar.showSnackbar(context, 'User Logged out successfully');
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      CustomSnackbar.showSnackbar(
        context,
        e.message!,
        backgroundColor: Colors.red,
      );
    }
  }
}
