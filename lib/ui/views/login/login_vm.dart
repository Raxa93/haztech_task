// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:untitled/data/base/base_vm.dart';
import 'package:untitled/data/repo/auth_repo/auth_repo.dart';
import 'package:untitled/ui/utilities/validators.dart';


class LoginViewModel extends BaseVm {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isHidden = true;

  final repo = GetIt.instance.get<AuthRepo>();

  // Getters
  bool get isHidden => _isHidden;

  TextEditingController get emailController => _emailController;

  TextEditingController get passwordController => _passwordController;

  String? Function(String? password) get passwordValidator =>
      Validator.passwordValidator;

  String? Function(String? email) get emailValidator =>
      Validator.emailValidator;

  // Setters
  set setIsHidden(bool val) {
    debugPrint('value i am gonna set $val');
    _isHidden = val;
    notifyListeners();
  }


  Future<String?> loginWithEmailAndPassword(BuildContext context) async {
    EasyLoading.show();
    debugPrint('This is value i wil login with ${emailController.text} and ${passwordController.text}');
    var value = await repo.signInWithEmailAndPassword(emailController.text, passwordController.text, context);
    EasyLoading.dismiss();
    return value;

  }


  loginWithGoogle({required BuildContext context}) async {
    await repo.signInWithGoogle().then((value) async {
      debugPrint('I got this value in vm $value');
      // Navigator.pushNamed(context, AgencyRegistrationScreen.routeName
      // );
    });
  }

  Future resetPassword() async {
    return await repo.resetPassword(_emailController.text);
  }
}
