import 'package:flutter/material.dart';

import 'auth_repo.dart';

class AuthRepoImp extends AuthRepo {
  @override
  Future<String?> signInWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    return await authService.signInWithEmailAndPassword(
        email, password, context);
  }

  @override
  Future<String?> registerUser(String email, String password) async {
    return await authService.registerWithEmailAndPassword(email, password);
  }

  @override
  Future<String?> signInWithGoogle() async {
    return await authService.signInWithGoogle();
  }

  @override
  Future sendVerifyEmail() async {
    return await authService.sendVerificationEmail();
  }

  @override
  Future checkEmailIsVerified() async {
    return await authService.checkEmailVerification();
  }

  @override
  Future resetPassword(String email) async {
    return await authService.resetPassword(email);
  }
}
