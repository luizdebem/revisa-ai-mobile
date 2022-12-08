import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:revisa_ai_mobile/components/base_button.dart';
import 'package:revisa_ai_mobile/models/answer_model.dart';
import 'package:revisa_ai_mobile/models/quiz_model.dart';
import 'package:revisa_ai_mobile/screens/home_screen.dart';

class ResultScreen extends StatefulWidget {
  static const routeName = "/results";
  const ResultScreen({Key? key}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  late Answer answer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments;
    answer = Answer.fromJson(jsonDecode(jsonEncode(args)));
  }

  String greetingMessage() {
    return answer.score! >= 8.0 ? "Parabéns! Sua nota foi:" : "Sua nota foi:";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Revisa Aí"),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(greetingMessage()),
                Text(
                  answer.score!.toString(),
                  style: const TextStyle(fontSize: 150, color: Colors.blue),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Moedas recebidas neste quiz: "),
                    Text(
                      "${answer.prizeEarned!.toString()} moedas.",
                      style: const TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                BaseButton(
                  onPressed: () => Navigator.pushNamedAndRemoveUntil(
                    context,
                    HomeScreen.routeName,
                    (route) => false,
                  ),
                  child: const Text("Sair"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
