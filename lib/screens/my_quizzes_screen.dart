import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:revisa_ai_mobile/models/answer_model.dart';
import 'package:revisa_ai_mobile/services/quiz_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyQuizzesScreen extends StatefulWidget {
  const MyQuizzesScreen({Key? key}) : super(key: key);

  @override
  State<MyQuizzesScreen> createState() => _MyQuizzesScreenState();
}

class _MyQuizzesScreenState extends State<MyQuizzesScreen> {
  final DateFormat formatter = DateFormat('dd/MM/yyyy');

  late List<Answer> answers = [];

  void fetchAnswers() async {
    final prefs = await SharedPreferences.getInstance();

    final res = await QuizService.listByStudentId(
      jsonDecode(prefs.getString("user")!)["_id"],
    );
    final resParsed = res.data as List;

    List<Answer> appendList = [];

    for (var element in resParsed) {
      appendList.add(Answer.fromJson(element));
    }

    setState(() {
      answers = appendList;
    });
    print(answers);
  }

  @override
  void initState() {
    super.initState();
    fetchAnswers();
  }

  @override
  Widget build(BuildContext context) {
    return answers.isNotEmpty
        ? SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: DataTable(
              columns: const [
                DataColumn(
                  label: Text("Data"),
                ),
                DataColumn(
                  label: Text("Nota"),
                ),
                DataColumn(
                  label: Text("Moedas"),
                ),
              ],
              rows: [
                ...answers.map((a) {
                  return DataRow(
                    cells: [
                      DataCell(
                        Text(
                          formatter.format(
                            DateTime.parse(
                              a.createdAt!,
                            ),
                          ),
                        ),
                      ),
                      DataCell(Text("${a.score}")),
                      DataCell(Text("${a.prizeEarned}")),
                    ],
                  );
                })
              ],
            ))
        : const Center(
            child: Text(
              "Você ainda não respondeu a nenhum quiz.",
            ),
          );
  }
}
