import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:revisa_ai_mobile/components/base_button.dart';
import 'package:revisa_ai_mobile/components/question.dart';
import 'package:revisa_ai_mobile/models/quiz_model.dart';
import 'package:revisa_ai_mobile/screens/result_screen.dart';
import 'package:revisa_ai_mobile/services/quiz_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuizScreen extends StatefulWidget {
  static const routeName = "/quiz";
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late Quiz quiz;
  late Map answers;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments;
    quiz = Quiz.fromJson(jsonDecode(jsonEncode(args)));
    answers = quiz.questions!.asMap().map((k, v) => MapEntry(k, null));
  }

  void submit() async {
    final prefs = await SharedPreferences.getInstance();
    try {
      final res = await QuizService.submit({
        "studentId": jsonDecode(prefs.getString("user")!)["_id"],
        "quizId": quiz.id,
        "answers": answers.values.toList(),
      });
      Navigator.of(context).pushNamedAndRemoveUntil(
        ResultScreen.routeName,
        (route) => false,
        arguments: res.data,
      );
    } catch (e) {
      print(e);
    }
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Revisa Aí"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: quiz.questions!.length,
                itemBuilder: (context, index) {
                  return QuestionWidget(
                    index: index + 1,
                    question: quiz.questions![index],
                    onSelect: (option) {
                      setState(() {
                        answers[index] = option;
                      });
                    },
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
              ),
            ),
            const SizedBox(height: 15),
            BaseButton(
              onPressed: submit,
              child: const Text("ENVIAR RESPOSTAS"),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
