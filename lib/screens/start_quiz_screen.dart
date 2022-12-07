import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:revisa_ai_mobile/helpers.dart';
import 'package:revisa_ai_mobile/screens/quiz_screen.dart';
import 'package:revisa_ai_mobile/services/quiz_service.dart';

class StartQuizScreen extends StatefulWidget {
  const StartQuizScreen({Key? key}) : super(key: key);

  @override
  State<StartQuizScreen> createState() => _StartQuizScreenState();
}

class _StartQuizScreenState extends State<StartQuizScreen> {
  void goToQuiz(password) async {
    try {
      final res = await QuizService.find(password);
      Navigator.of(context).pushNamed(
        QuizScreen.routeName,
        arguments: res.data[0],
      );
    } catch (e) {
      if (e is DioError && e.response!.statusCode == 404) {
        Helpers.showToast(msg: "Quiz não encontrado.", success: false);
        return;
      }
      Helpers.showToast(msg: "Ocorreu um erro interno.", success: false);
      return;
    }
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Insira a senha do quiz para começar!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 20),
          PinCodeTextField(
            appContext: context,
            length: 6,
            enableActiveFill: true,
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(5),
              fieldHeight: 50,
              fieldWidth: 40,
              inactiveFillColor: Colors.white,
              selectedFillColor: Colors.white,
              activeFillColor: Colors.white,
              activeColor: Theme.of(context).primaryColor,
              selectedColor: Theme.of(context).primaryColor,
              errorBorderColor: Theme.of(context).primaryColor,
              disabledColor: Theme.of(context).primaryColor,
              inactiveColor: Theme.of(context).primaryColor,
            ),
            textCapitalization: TextCapitalization.characters,
            onChanged: (String value) => {},
            onCompleted: goToQuiz,
            onSubmitted: goToQuiz,
          ),
        ],
      ),
    );
  }
}
