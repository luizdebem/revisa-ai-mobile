import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:revisa_ai_mobile/screens/home_screen.dart';
import 'package:revisa_ai_mobile/screens/login_screen.dart';
import 'package:revisa_ai_mobile/screens/quiz_screen.dart';
import 'package:revisa_ai_mobile/screens/result_screen.dart';
import 'package:revisa_ai_mobile/screens/signup_screen.dart';
import 'package:revisa_ai_mobile/services/login_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp(
        title: 'Revisa Aí',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: Theme.of(context).textTheme.apply(
                fontSizeFactor: 1.1,
                fontSizeDelta: 2.0,
              ),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: LoginScreen.routeName,
        routes: {
          LoginScreen.routeName: (context) => const LoginScreen(),
          SignupScreen.routeName: (context) => const SignupScreen(),
          HomeScreen.routeName: (context) => const HomeScreen(),
          QuizScreen.routeName: (context) => const QuizScreen(),
          ResultScreen.routeName: (context) => const ResultScreen(),
        },
      ),
    );
  }
}
