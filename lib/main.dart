import 'package:db_demo/pages/home_page.dart';
import 'package:db_demo/pages/login_page.dart';
import 'package:db_demo/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  await Hive.initFlutter();
  await Hive.openBox("pdp_online");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LogInPage(),
      routes: {
     HomePage.id :(context)=>HomePage(),
     LogInPage.id:(context)=>LogInPage(),
        SignUpPage.id:(context)=>SignUpPage(),
      }
    );
  }
}

