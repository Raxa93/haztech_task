// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:untitled/data/model/brewry_model.dart';
import 'package:untitled/ui/views/brewery/brewery_main.dart';
import 'package:untitled/ui/views/brewery/brewr_detail.dart';
import 'package:untitled/ui/views/home/home_view.dart';
import 'package:untitled/ui/views/login/forget_password_view.dart';
import 'package:untitled/ui/views/register/register_view.dart';
import 'package:untitled/ui/views/register/verification_view.dart';

import 'ui/views/login/login_view.dart';
Route<dynamic> generateRoute(RouteSettings settings){
switch(settings.name)
{
  case LoginView.routeName:
  return MaterialPageRoute(builder: (context) =>  LoginView());
  case RegisterView.routeName:
  return MaterialPageRoute(builder: (context) =>  RegisterView());
  case VerificationView.routeName:
  return MaterialPageRoute(builder: (context) =>  VerificationView(email: settings.arguments as String,));
  case HomeView.routeName:
    return MaterialPageRoute(builder: (context) =>  HomeView());
  case ForgetPasswordView.routeName:
    return MaterialPageRoute(builder: (context) =>  ForgetPasswordView());
  case BreweryMainView.routeName:
    return MaterialPageRoute(builder: (context) =>  BreweryMainView());
    case BreweryDetailView.routeName:
    return MaterialPageRoute(builder: (context) =>  BreweryDetailView(brewerModel: settings.arguments as BreweryModel));

  default:
    return errorRoute();
}
}

Route<dynamic> errorRoute() {
  return MaterialPageRoute(
    builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Arggg!'),
        ),
        body: const Center(
          child: Text('Oh No! You should not be here! '),
        ),
      );
    },
  );
}
