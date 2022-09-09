



import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:untitled/router.dart';
import 'package:untitled/ui/views/brewery/brewery_main.dart';
import 'package:untitled/ui/views/brewery/brewery_vm.dart';
import 'package:untitled/ui/views/home/home_vm.dart';
import 'package:untitled/ui/views/login/login_view.dart';
import 'package:untitled/ui/views/login/login_vm.dart';
import 'package:untitled/ui/views/register/register_vm.dart';

import 'locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await setUpLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => RegisterViewModel()),
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(create: (_) => BreweryVm()),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: LoginView.routeName,
        // initialRoute: BreweryMainView.routeName,
        builder: EasyLoading.init(),
        onGenerateRoute: (settings) => generateRoute(settings),
      ),
    );
  }
}