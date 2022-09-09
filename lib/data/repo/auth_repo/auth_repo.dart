

import 'package:flutter/material.dart';
import 'package:untitled/data/base/base_repo.dart';

abstract class AuthRepo extends BaseRepo{

  Future<String?> signInWithEmailAndPassword(String email,String password,BuildContext context);
  Future<String?> registerUser(String email,String password);
  Future<String?> signInWithGoogle();
  Future sendVerifyEmail();
  Future checkEmailIsVerified();
  Future resetPassword(String email);


}