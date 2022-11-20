import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class StartQuizScreen extends StatefulWidget {
  const StartQuizScreen({Key? key}) : super(key: key);

  @override
  State<StartQuizScreen> createState() => _StartQuizScreenState();
}

class _StartQuizScreenState extends State<StartQuizScreen> {
  void goToQuiz(s) {
    // go to quiz
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Insira a senha do quiz para começar!"),
          const SizedBox(height: 20),
          PinCodeTextField(
            appContext: context,
            length: 6,
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
