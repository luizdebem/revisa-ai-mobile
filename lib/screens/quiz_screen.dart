import 'package:flutter/material.dart';
import 'package:revisa_ai_mobile/components/base_button.dart';
import 'package:revisa_ai_mobile/components/question.dart';

class QuizScreen extends StatefulWidget {
  static const routeName = "/quiz";
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
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
                itemCount: 15,
                itemBuilder: (context, index) {
                  return Question(index: index + 1);
                },
                separatorBuilder: (context, index) => const Divider(),
              ),
            ),
            const SizedBox(height: 15),
            BaseButton(onPressed: () {}, child: const Text("ENVIAR RESPOSTAS")),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
